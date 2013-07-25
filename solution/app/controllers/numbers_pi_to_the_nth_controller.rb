
require 'bigdecimal'
require 'bigdecimal/math'
include BigMath

class NumbersPiToTheNthController < ApplicationController

  def index
  end

  def compute
 	number = params[:number]
 	if number.integer? and number > 0
    	@result = PI(number)
 	else
 		@result = nil
  	end
  end

end
