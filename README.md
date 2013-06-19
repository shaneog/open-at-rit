# [Open at RIT](http://openatrit.herokuapp.com)
[![Build Status](https://secure.travis-ci.org/thenickperson/open-at-rit.png?branch=master)](http://travis-ci.org/thenickperson/open-at-rit)
[![Dependency Status](https://gemnasium.com/thenickperson/open-at-rit.png)](https://gemnasium.com/thenickperson/open-at-rit)
[![Code Climate](https://codeclimate.com/github/thenickperson/open-at-rit.png)](https://codeclimate.com/github/thenickperson/open-at-rit)
[![Coverage Status](https://coveralls.io/repos/thenickperson/open-at-rit/badge.png)](https://coveralls.io/r/thenickperson/open-at-rit)

## Project Status
__Unstable and in development.__

Please do not rely on it yet, as locations are currently always displayed as
closed (which is innacurate). This should be fixed soon.

## About
Open at RIT is a simple one-page web application that makes it easy to check
which dining locations are currently open at the [Rochester Institute of
Technology](https://www.rit.edu).

## Definite Features (in development)
- a simple, color-coded display that makes it easy to see what's open
- a responsive design that also works well on smartphones
- information on the hours for different locations
- support for special hours (hours for time periods where students do not often
  take classes, such as breaks and summer quarters/semesters)

## Possible Features
- sorting locations based on name, open/closed status, hours, etc.
- filtering locations based on tags
- support for other kinds of locations (like offices, labs, and stores)
- a scraper that automatically updates the app's database with information from
  RIT's website
- a simple JSON API

## Installation
Before you start, install and use Ruby 2.0. Make sure you have the bundler gem. It will install Rails 4 for you.
```bash
git clone https://github.com/thenickperson/open-at-rit.git`
cd open-at-rit
bundle install
rake db:setup
rails server
```

## Technology Stack
- Ruby 2
- Rails 4 (currently edge, in development)
- JavaScript
- SASS
- Heroku (for production)

## Updating Hours
This app currently uses the `lib/locations.yml` file to store information on
locations and their hours. This data file must be updated manually. `rake
db:seed` will use this file to generate the database of locations from this
file. After that, the database should not need to be modified unless hours
or locations need to be updated.
