class TilesCalculatorController < ApplicationController

  def index
  	width = params[:inputWidth]
  	height = params[:inputHeight]
  	price = params[:inputPrice]
  	@ok = false
  	if width.nil? or height.nil? or price.nil?
  		return
  	elsif width.to_f == 0.0 or height.to_f == 0.0 or price.to_f == 0.0
  		return
  	else
  		@ok = true
  		@cost = "%.2f" % (width.to_f * height.to_f * price.to_f)
  		@area = "%.2f" % (width.to_f * height.to_f)
  	end

  end
end

