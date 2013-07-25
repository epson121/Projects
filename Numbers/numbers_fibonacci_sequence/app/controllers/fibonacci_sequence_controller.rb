class FibonacciSequenceController < ApplicationController
	
	def index
		value = params[:number]
		if value.nil?
			return
		end
		if value.to_i.integer? and value.to_i > 0
			@size = value
			@number = fibonacci(value.to_i)			
		end
	end

	#method that calculates the fibonacci sequence
	#returns an array of values with length of the number inserted
	def fibonacci(v)
		if v == 1
			return 0
		end
		if v == 2
			return 1
		end
		result = [0, 1]
		f1 = 0
		f2 = 1
		c = 2
		while c < v do
			f3 = f1 + f2
			result << f3
			f1 = f2
			f2 = f3
			c += 1
		end
		return result
	end

end
