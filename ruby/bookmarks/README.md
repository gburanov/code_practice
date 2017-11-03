## How to
* puma to start server

## Search
* Looks for exact matches
* Looks in all fields
* See spec for details
* In the real world, search would be moved to ELK or at least to db

## DB
* I use pg only on production, I don't have it locally and did not want to mess with docker envs for this task
* But of course in real time it would be nice

## Heroku
* I deployed it to Heroku
* I am greedy and don't want extra repo in my github, so I use subfolder
* I use this to push to Heroku
```
git subtree push --prefix output heroku master
```
* Check it out https://ancient-depths-65232.herokuapp.com/

## Validations
* Only backend
* Not full - some url validations can be better
* As well as error messages
* Had no time to add FE

## What have I done
* Started with rails 5
* Used as many Rails as possible - including views
* Wrote some basic tests - definitely less than needed because I am out of time
* I use local: true in forms in preserve old Rails - I would not do it in real life
* Instead of controller tests I decided to concentrate on integration - quick win

## Some things to improve
* I would definitely use pure frontend and return just json
* Add auth - devise? - if needed?
* Use different DB

* Improve frontend - I am just a BE dev
* Add FE validations - now it is only BE
* I would use Rails only for the backend in real project - and write FE in smth like React/Rails
* Definitely write more test
* Speaking about specs, I think I would use factory girl in real life but it does not go by default
* Definitely add CI/CD - it was not mentioned in the task and I do not have time for it
