require 'unit_table' 

class UnitConverterController < ApplicationController



  UNITS = [["Temperature", 1], ["Mass", 2], ["Speed", 3], ["Length", 4], ["Volume", 5], ["Area", 6]]
  TEMP = [["Celsius", 1],["Fahrenheit", 2]]
  MASS = [["Kilogram", 1],["Gram", 2],["Miligram", 3], ["Metric ton", 4], ["Pound", 5]]
  SPEED = [["Km/h", 1], ["Mph", 2]]
  LENGTH = [["Kilometer", 1], ["Meter", 2], ["Centimeter", 3], ["Milimeter", 4], ["Mile", 5]]
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
    if params[:id] == "unit"
      @leftSelected = @left[0]
      @rightSelected = @right[1]
    else 
      @leftSelected = @left[params[:lv].to_i - 1]
      @rightSelected = @right[params[:rv].to_i - 1]
    end

    if !params[:li].empty?
      @inputLeft = params[:li]
      @inputRight = convert(params[:ms], params[:lv], params[:rv], params[:li])
    elsif !params[:ri].empty?
      @inputRight = params[:ri]
      @inputLeft = convert(params[:ms], params[:rv], params[:lv], params[:ri])
    else
      @inputLeft = ""
      @inputRight = ""
    end

    respond_to do |format|
      format.js
    end
  end

  def calc
    @units = UNITS
    @unitSelected = UNITS[params[:ms].to_i - 1]
    @left = ORD[params[:ms].to_i - 1]
    @right = ORD[params[:ms].to_i - 1]
    @leftSelected = @left[params[:lv].to_i - 1]
    @rightSelected = @right[params[:rv].to_i - 1]
    
    if params[:id] == "inputLeft"
      @inputLeft = params[:li]
      @inputRight = convert(params[:ms], params[:lv], params[:rv], params[:li])
    else
      @inputRight = params[:ri]
      @inputLeft = convert(params[:ms], params[:rv], params[:lv], params[:ri])
    end

    #@left = ORD[params[:ms].to_i - 1]
    #@right = ORD[params[:ms].to_i - 1]
    #@leftSelected = @left[0]
    #@rightSelected = @right[1]
    #@inputLeft = params[:li]
    #@inputRight = params[:li]

    respond_to do |format|
      format.js
    end
  end

  ##
  # Converts units fromUnit -> toUnit
  def convert(measurement, fromUnit, toUnit, value)
              #Temperature
    
    if measurement == "1"
      if fromUnit == "2" and toUnit == "1"
        begin
          return eval( "(" + value + TABLE[measurement.to_i][fromUnit.to_i][toUnit.to_i])
        rescue Exception => e
          return 0
        end
      else
        begin
          return eval(value + TABLE[measurement.to_i][fromUnit.to_i][toUnit.to_i])
        rescue Exception => e
          return 0
        end
      end
    else
      begin
        return eval(value + "*" + TABLE[measurement.to_i][fromUnit.to_i][toUnit.to_i])
      rescue Exception => e
        return 0
      end
    end
  end
end
