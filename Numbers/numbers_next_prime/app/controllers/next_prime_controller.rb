class NextPrimeController < ApplicationController

	#this should be optimized by finding the nth prime number and just appending it to an array
	# this counter is ok for smaller amounts of primes.
  def index
  	value = params[:current_prime]
  	if value.nil?
  		@current_prime = 0
  	else
  		@current_prime = value
  		@prime_list = primes(@current_prime.to_i)
  	end
  end

	def primes(n)
		counter = 0
		primes = []
		start = 2
		while counter < n do
			prime = true
			(2..start - 1).each do |v|
				if start % v == 0
					prime = false
				end
			end
			if prime == true
				counter += 1
				primes << start
				prime = false
			end
			start += 1
		end
		return primes
	end

end
