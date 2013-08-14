require 'geocoder'

class CityDistanceController < ApplicationController
  
  def index
  	#add regex checking
  	if !params[:pl].nil? and !params[:pr].nil? and !params[:pl].empty? and !params[:pr].empty?
	  		@left = Geocoder.search(params[:pl])
	  		@right = Geocoder.search(params[:pr])
	  		@distance = Geocoder::Calculations.distance_between([@left[0].latitude, @left[0].longitude], 
	  																																 	[@right[0].latitude, @right[0].longitude]) * 1.60934
	  		@distance = "%.2f km" % @distance
	  		respond_to do |format|
	  			format.js
				end
  	end
  end

end
