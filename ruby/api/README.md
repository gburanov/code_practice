## README
* This solution is definitely not final, but you can see my progess (I spent 2.5 evenings on that)\
* I should use json for error renderning, but I am new to jbuilder and don't know how to render simple json without views

## Why use Rails 5 here?
* I was generally interested in new technology
* Use rails-api that is now part of Rails 5 https://github.com/rails/rails/pull/19832

## Tests
* I have added both rspec tests (not 100% finished) and test-unit
* Generally for the big projects I prefer rspec (because of the power)
* But in this small case probably test-unit is better (by default, faster)

## Conversion to json
* This is API, and I intentionally decided to use gem for json templates
* In this case you got nice controller/view separation for json from the very begin
* I intentionaly decided not to use Active Model Serializers
* Because in this case you will code json view in Model
* This can be ok for the small project, but will really uglify it if it will grow
* I was choosing between rabl and jbuilder and used jbuilder (because it seems to be preinstalled with rails 5)
