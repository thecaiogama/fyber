Fyber integration [![Build Status](https://travis-ci.org/thecaiogama/fyber.svg?branch=master)](https://travis-ci.org/thecaiogama/fyber)
====

How & why

Hello Fyber team,

For this challenge, I chose to use Sinatra for its simplicity. Getting things up and running with it is as easy as it sound and gives me some great malleability to create helpers, views - with any html engine- and any gems for tests.

All the configuration needed to run the project was made using environment variables which are defined at the spec_helper.rb file, for test purpose.

Regarding tests, I chose the TDD approach, testing as much as I could, from endpoints to the sha1 hash result, using VCR to mock test scenarios that had requests to the Fyber API, so I could test cases with and without data.
Also, I integrated the project with Travis CI so I could get a better test radar and be 100% sure that everything was running smoothly.

Alongside that, I used Twitter bootstrap to work on the HTML and some javascript with jquery, to make those requests in an async way.

The project was deployed to heroku, all the environment variables were properly created through the heroic dashboard, feel free to check it at: https://whispering-hollows-9955.herokuapp.com

Thank You,
Caio Gama
