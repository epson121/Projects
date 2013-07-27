class ChangeReturnController < ApplicationController
  
  def index
  	@cost = params[:inputCost].to_f
  	@given = params[:inputGiven].to_f
  	if @cost == 0.0 or @given == 0.0
  		return
  	elsif @given < @cost
  		@change = "You are " + ((@cost - @given).round(2)).to_s + " [currency] short."
  		return
  	else
  		@change = "Change: " + ((@given - @cost).round(2)).to_s + "[currency]."
  		@distribution = "Distribution {value -> number}: " + change_distribution((@given - @cost).round(2)).to_s
  	end
  end

  def change_distribution(change)
	  money = [1000.00, 500.00, 200.00, 100.00, 50.00, 20.00, 10.00, 5.00, 2.00, 1.00, 0.50, 0.20, 0.10, 0.05, 0.02, 0.01]
	  distribution = [0] * money.length
	  counter = 0
	  while change > 0 do
	    p change
	    p money[counter]
	  	while (change - money[counter]) >= 0 do
	      distribution[counter] += 1
	      change = (change - money[counter]).round(2)
	    end
	    counter += 1
	  end
	  return Hash[money.zip distribution]
	end

end
