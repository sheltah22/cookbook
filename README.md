# Cookbook

## Description
A website containing a database of recipes indexed by ingredient and quantity of ingredient. 

## Building Instructions
1) `docker-compose build`
2) `docker-compose up`
3) `docker-compose run web rails db:create`
4) `docker-compous run web rails db:migrate`
5) `docker-compose run web rails db:seed`

## Testing Instructions
Run `docker-compose run -e "RAILS_ENV = test" web spring rspec`

## About
The site features all of the main lessons I have taken from working with Ruby on Rails: it uses the mvc scheme to display pages, displays structured data stored in a database, contains forms for adding to this database, and a features a search system to filter this data. The website displays user-generated recipes, which are structured to include ingredients composed of foods and their measurements; in order to relate these together with minimal repeated storage of data, I learned about join tables and the different types of relationships between tables, including has-one, has-many, and has-and-belongs-to-many. In developing forms to add this data I dealt with issues of cleaning user-inputted data and using to fetch and update models already stored in the database and configuring public gems to work with my codebase. Finally, implementing the search system allowed me to apply what I learned from working on the NAMI project’s advanced search feature. 
