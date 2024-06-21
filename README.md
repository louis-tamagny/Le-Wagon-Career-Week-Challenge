# Interview technical challenge exemple
Proposed in the context of the Le Wagon bootcamp career week.

## Goals
Build a rails api app that serves a single end-point /museums with two parameters: lng and lat.
When given a longitude and a latitude, send back JSON containing a list of museums situated around the coordinates.

## Tools
Ruby on Rails, MapBoxGL

## How to test
Clone the repository.

Go to the project repository.

Run rails bundle install.

Run MAPBOX_TOKEN={your_mapbox_token} rails s.

Send a request to http://localhost:3000/museums?lng={longitude}&lat={latitude}
