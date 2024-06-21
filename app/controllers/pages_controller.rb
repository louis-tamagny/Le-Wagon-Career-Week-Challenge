require 'open-uri'

class PagesController < ApplicationController
  def museums
    token = ENV['MAPBOX_TOKEN']
    proximity = "#{params[:lng]}%2C#{params[:lat]}"
    bbox = "#{params[:lng].to_f - 5}%2C#{params[:lat].to_f  - 5}%2C#{params[:lng].to_f  + 5}%2C#{params[:lat].to_f  + 5}"
    query = "https://api.mapbox.com/search/searchbox/v1/category/museum?access_token=#{token}&language=en&limit=10&proximity=#{proximity}&bbox=#{bbox}"
    doc = JSON.parse(URI.open(query).read)
    museums = {}

    doc['features'].each do |feature|
      key = feature['properties']['context']['postcode']['name']
      if museums.keys.include?(key)
        museums[key] << feature['properties']['name']
      else
        museums[key] = [feature['properties']['name']]
      end
    end


    render json: museums
  end
end
