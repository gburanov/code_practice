#  Steps
* Build the service
```
docker-compose build
```
* Start the service
```
docker-compose up
```
* Check GUI
```
http://127.0.0.1:4567/
```
* Run tests
```
docker-compose run importer rspec
```

## Solution
* Uses postgres but only in production
* two separate processes - to read and to write data
* Read process can be run in the background

## How to download
* You can use http://kinolien.github.io/gitzip/ for it (or download the whole repo)
