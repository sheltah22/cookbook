# Cookbook

## Description
A website containing a database of recipes indexed by ingredient and quantity of ingredient. 

## Building Instructions
1) `docker-compose build`
2) `docker-compose up`
3) `docker-compose run web rake db:create`

## Testing Instructions
Run `docker-compose run -e "RAILS_ENV = test" web rake test`
