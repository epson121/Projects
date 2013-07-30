class CalculatorController < ApplicationController
  

  def index
  	if !params[:input].nil?
  		@input = params[:input].gsub("sin", "Math.sin").gsub("cos", "Math.cos")
  		begin
  			@input = eval(@input)
  		rescue SyntaxError => se
  			@input = "ERR"
  		end
  	end

  end

end
