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

    # this is hacky
    geom=RGeo::GeoJSON.decode(feature)
    Entry.create(json: feature.to_json, name: name, geom: geom.geometry.as_text)
  end
  redirect "/results"
end

get "/results" do
  j=Entry.all.map{|e| e.json.sub(/,$/,'')}.join(",\n")
  %Q{{ "type": "FeatureCollection",
"features": [ #{j} ]     
}}
end
