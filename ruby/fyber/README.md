# Server
* I decided to start with Sinatra and not with classical Rails app
* Sinatra is a little bit new to me, so that was a  way to learn for me as well
* Generally Sinatra is faster, but I think in this case bottleneck is network connection to Fyber, so I think Rails speed would be about the same
* Another idea is to use new Rails 5 API mode

# Testing
* There are some tests (in acceptance folder) that do real service calls
* In real time they should of course be avoided
* Probably one should use contract driven tests instead
* For example pacto gem. But I had no time to implement that
* For all tests run (can fail because of network and unreliable fyber side)

  rspec

* For all non-acceptance tests

  rake
  
* Please notice that the sinatra sever itself was not unit tested (because I had only 3 days), but I tried to move most of the logic out of it

# Deploy

### Build docker image

  ./scripts/build.rb

### Deploy docker image to docker hub (only if you have rights)

  ./scripts/build.rb

### Run docker image (don't forget to set ENV variables)

  ./scripts/run.rb

## Deployed URL http://fyber.gburanov.me:8080/
