class UnitConverterController < ApplicationController
  
  respond_to :html, :js

  UNITS = [["Temperature", 1], ["Mass", 2], ["Speed", 3], ["Length", 4], ["Volume", 5], ["Area", 6]]
  TEMP = [["Celsius", 1],["Fahrenheit", 2]]
  MASS = [["Kilogram", 1],["Gram", 2],["Miligram", 3], ["Metric ton", 4], ["Pound", 5]]
  SPEED = [["Km/h", 1], ["Mph", 2]]
  LENGTH = [["Kilometer", 1], ["Meter", 2], ["Centimeter", 3], ["Milimeter", 4], ["Mile", 5], ["Yard", 6], ["Foot", 7], ["Inch", 8]]
  VOLUME = [["Cubic meter", 1], ["Galon", 2], ["Liter", 3]]
  AREA = [["Square km", 1], ["Square m", 2], ["Hectare", 3], ["Square mils", 4]]
  ORD = [TEMP, MASS, SPEED, LENGTH, VOLUME, AREA]

  def index
    @units = UNITS
    @left = ORD[0]
    @right = ORD[0]
    @leftSelected = @left[0]
    @rightSelected = @right[1]
  end

  def change
    @units = UNITS
    @unitSelected = UNITS[params[:ms].to_i - 1]
    @left = ORD[params[:ms].to_i - 1]
    @right = ORD[params[:ms].to_i - 1]
    @leftSelected = @left[0]
    @rightSelected = @right[1]
    render :partial => "whole", :locals => { 
                                  :left => @left,
                                  :right => @right,
                                  :inputLeft => @inputLeft,
                                  :inputRight => @inputRight,
                                  :leftSelected => @leftSelected,
                                  :rightSelected => @rightSelected
                                }
  end

  def calc
    @units = UNITS
    @unitSelected = UNITS[params[:ms].to_i - 1]
    @left = ORD[params[:ms].to_i - 1]
    @right = ORD[params[:ms].to_i - 1]
    @leftSelected = @left[0]
    @rightSelected = @right[1]
    @inputLeft = params[:li]
    @inputRight = params[:li]
    
    respond_to do |format|
      format.js
    end
  end

  def calculate
    if !params[:inputLeft].empty?
      @inputLeft = "%.2f" % params[:inputLeft].to_f
      @inputRight = convert(params[:unit], params[:left], params[:right], params[:inputLeft])
    elsif !params[:inputRight].empty?
      @inputLeft = convert(params[:unit], params[:right], params[:left], params[:inputRight])
    else
    end
    @units = UNITS
    @unitSelected = UNITS[params[:unit].to_i - 1]
    @left = ORD[params[:unit].to_i - 1]
    @right = ORD[params[:unit].to_i - 1]
    @leftSelected = @left[params[:left].to_i - 1]
    @rightSelected = @right[params[:right].to_i - 1]
  end


  

  ##
  # Converts units fromUnit -> toUnit
  def convert(measurement, fromUnit, toUnit, value)
              #Temperature
    temp_c = {1 =>  {
                      #Celsius to ->
                      1 => { 
                        #Celsius
                        1 => "",
                        #Fahrenheit 
                        2 => ".to_f * 9/5 + 32.to_f"
                      }, 
                      #Fahrenheit to ->
                      2 => { 
                        #Celsius
                        1 => "-32) * 5/9.to_f", 
                        #Fahrenheit
                        2 => ""
                      } 
                    },
              #Mass
              2 => {
                      #Kilogram to ->
                      1 => {
                        #Kilogram
                        1 => "1",
                        #Gram
                        2 => "1000",
                        #Miligram
                        3 => "1000000",
                        #Ton
                        4 => "0.001", 
                        #Pound
                        5 => "2.2046"
                      },
                      #Gram to ->
                      2 => {
                        #Kilogram
                        1 => "0.001",
                        #Gram
                        2 => "1",
                        #Miligram
                        3 => "1000",
                        #Ton
                        4 => "0.000001",
                        #Pound
                        5 => "0.0022046"
                      },
                      #Miligram to ->
                      3 => {
                        #Kilogram
                        1 => "0.000001",
                        #Gram
                        2 => "0.001",
                        #Miligram
                        3 => "1",
                        #Ton
                        4 => "0.000000001",
                        #Pound
                        5 => "0.0000022046"
                      },
                      #Ton to ->
                      4 => {
                        #Kilogram
                        1 => "1000",
                        #Gram
                        2 => "1000000",
                        #Miligram
                        3 => "1000000000",
                        #Ton
                        4 => "1",
                        #Pound
                        5 => "2204.6"
                      },
                      #Pound to ->
                      4 => {
                        #Kilogram
                        1 => "0.4535",
                        #Gram
                        2 => "453.597",
                        #Miligram
                        3 => "453597.024",
                        #Ton
                        4 => "0.0004535",
                        #Pound
                        5 => "1"
                      }
                  }
              }
    if measurement == "1"
      if fromUnit == "2" and toUnit == "1"
        return "%.6f" % eval( "(" + value + temp_c[measurement.to_i][fromUnit.to_i][toUnit.to_i])
      else
        return "%.6f" % eval(value + temp_c[measurement.to_i][fromUnit.to_i][toUnit.to_i])
      end
    else
      return "%.6f" % eval(value * temp_c[measurement.to_i][fromUnit.to_i][toUnit.to_i])
    end
  end
end
