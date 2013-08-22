class TaxCalculatorController < ApplicationController
  def index
  	begin
  		total = calculate_tax(Float(params[:price]), 
  							  Float(params[:tax]))
  	rescue
  		total = nil
  	end
  	if !total.nil?
  		p = "%.2f" % total.to_s
  		t = "%.2f" % (total - Float(params[:price])).to_s
  		@msg = "Price is " + p + 
  			   ". Tax is " + t + "."
	 	else
	 		@msg = "Wrong input values!"
  	end
  end

  def calculate_tax(price, tax)
  	total_price = price + price * (tax/100.00)
  	return total_price
  end

end
