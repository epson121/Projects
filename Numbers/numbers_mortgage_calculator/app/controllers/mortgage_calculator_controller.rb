class MortgageCalculatorController < ApplicationController

  def index
  	@value = 0
  	@loan = params[:inputLoan]
  	@duration = params[:inputDuration]
  	@rate = params[:inputRate]
  	if @loan.nil? or @duration.nil? or @rate.nil?
      @value, @loan, @duration, @rate = 0, nil, nil, nil
   		return
  	elsif @loan.to_f == 0.0 or @duration.to_f == 0.0 or @rate.to_f == 0.0
      @value, @loan, @duration, @rate = 0, nil, nil, nil
  		return
  	elsif @loan.to_f < 0 or @duration.to_f < 0 or @rate.to_f < 0
      @value, @loan, @duration, @rate = 0, nil, nil, nil
  		return 
  	else
  		@value = "% .2f" % frm(@rate.to_f, @duration.to_f, @loan.to_f)
  	end
  end

	#@params r - interest rate (percentage)
	#@params n - number of years a loan is taken
	#@params po - borrowed amount
	#@return c - monthly payment
	def frm(r, n, po)
		# interest rate is converted to fraction and made a monthly
		r = r.to_f/100/12
		#number of years is converted to number of months
		n = n * 12
		#monthly payment is calculated
		c = (r / (1 - (1+r) ** -n) ) * po
		return c
	end

end


