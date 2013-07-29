class BinDecConverterController < ApplicationController

  def index
  	@bin = params[:inputBinary].to_i
  	@dec = params[:inputDecimal].to_i
  	#gets parameters and converts them to integers
  	# nil.to_i => 0
  	# so it is checked if it is not zero and converted 
  	# technically it does not work when input is 0 for bin or dec
  	if @bin != 0 
  		@dec = bin_to_dec(@bin)
  		if @dec == -1
  			@dec = nil
  			@error = "Invalid input"
  			return
  		end
  	elsif @dec != 0
  		@bin = dec_to_bin(@dec.to_i)
  		if @bin == -1
  			@bin = nil
  			@error = "Invalid input"
  			return
  		end
  	else
  		@bin = nil
  		@dec = nil
  	end
  end

	# gets the last digit and raises it to power of counter
	# then it is added to result
	# handles only positive numbers
	def bin_to_dec(number)
		counter = 0
		result = 0
		while number != 0
			temp = number % 10
			if temp > 1
				return -1
			end
			result += temp * 2 ** counter
			counter += 1
			number /= 10
		end
		return result
	end

	# gets the result of number % 2. Appends the result at the
	# beginning of the string and divides the number by 2 while > 0
	# returns string
	# handles only positive numbers
	def dec_to_bin(number)
		result = ""
		if number < 0
			return -1
		end
		while number != 0
			result.insert(0, (number % 2).to_s)
			number /= 2
		end
		return result
	end
end
