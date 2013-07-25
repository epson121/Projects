class PrimeFactorizationController < ApplicationController

  def index
  	value = params[:number]
  	if value.nil?
  		return
  	end
  	if value.to_i.integer? and value.to_i > 0
  		@number = value
  		@factors = simple_factoring(value.to_i)
  	end
  end

  #simple method for determining if a number is prime
  def naive_prime_method(n)
  	(2..Math.sqrt(n).ceil + 1).each do |v|
  		if n % v == 0
  			return v
  		end
  	end
  	return 1
  end

  #simple factoring of a number
  #using division
  #returns a hash where key is a factor and its value is number of times that factor 
  #is in the original number
  def simple_factoring(n)
  	result = {}
  	factor = naive_prime_method(n)
  	if factor == 1
  		result[n] = 1
  	else
  		while factor != 1 do
  			if result.has_key?(factor)
  				result[factor] += 1
  			else
  				result[factor] = 1
  			end
  			if naive_prime_method(n/factor) == 1
  				result[n/factor] = 1
  				return result
  			end
  			factor = naive_prime_method(n/factor)
  			n = n/factor
  		end
  	end
  	return result
  end
end
