# hoods

Is a project for crowdsourcing the boundaries of a city's neighborhoods, as seen by the people who live there (ideally). Developed by [Bostonography](http://www.bostonography.com) for that city's poorly-defined neighborhoods, it has since been applied to [Burlington, VT](http://btvhoods.geosprocket.org) and [Denver, CO](http://milehigh.geosprocket.org), with some [interesting results](http://btvhoods.geosprocket.org/results2.html).

It was then rewritten as a Sintra app.

### Configuration

1. Edit environments.rb to use the right database adapter.
2. run 'bundle install --path=vendor --binstubs'
3. run 'rake db:migrate'  -- if you are using PostGIS, it will also create a geometry column for you.
4. edit myneighborhoods.js to have your chosen neighbohood names and colors
5. run 'ruby app.rb' - your test server will now be running on localhost
6. Visit the site (http://localhost:4567), draw a few test polygons and watch them pile up in http://localhost:4567/results.html


### Authors
* Andy Woodruff (Author)
* Bill Morris (Repo monkey)
* Darrell Fuhriman (PHP hater)
