# app.rb

require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'
require 'rgeo/geo_json'

class Entry < ActiveRecord::Base
end

get "/" do 
  redirect "/index.html"  
end

post "/" do
  js="[#{params[:hoods].sub(/,$/,'')}]"
  puts js
  JSON.parse(js).each do |feature|
    name=feature['properties']['name']
    ent=Entry.create(json: feature.to_json, name: name)
    # this is hacky
    if ActiveRecord::Base.connection.adapter_name == 'PostGIS'
      geom=RGeo::GeoJSON.decode(feature)
      ent.geom=RGeo::GeoJSON.decode(feature).geometry.as_text
      ent.save
    end
  end
  redirect "/results"
end

get "/results" do
  j=Entry.all.map{|e| e.json.sub(/,$/,'')}.join(",\n")
  %Q{{ "type": "FeatureCollection",
"features": [ #{j} ]     
}}
end
