require 'spec_helper'

describe TaxCalculatorController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'index'" do
    it "returns http success" do
      post 'index'
      response.should be_success
    end

    it "should not have empty params when there is data inserted" do
	    post 'index' , :price => "100", :tax => "12.1"
	    controller.params[:price].should_not be_nil
	    controller.params[:price].should == '100'
	    controller.params[:tax].should_not be_nil
	    controller.params[:tax].should == '12.1'
		end

		it "should have @message set to 'Wrong input values!' when wrong input" do
			post 'index' , :price => "", :tax => ""
			assigns(:msg).should == "Wrong input values!"
		end

		it "should have @message set to 'Wrong input values!' when no price given" do
			post 'index' , :price => "", :tax => "10"
			assigns(:msg).should == "Wrong input values!"
		end

		it "should have @message set to 'Wrong input values!' when no tax given" do
			post 'index' , :price => "100", :tax => ""
			assigns(:msg).should == "Wrong input values!"
		end

		it "should have @message set properly when all data is given" do
			post 'index' , :price => "100", :tax => "10"
			assigns(:msg).should == "Price is 110.00. Tax is 10.00."
		end
  end

  describe "calculate_tax(price, tax) method" do
  	it "should return 0 for input of (0,0)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(0, 0).should == 0
  	end

  	it "should return 100 for input of (100, 0)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(100, 0).should == 100
  	end

  	it "should return 101 for input of (100, 1)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(100, 1).should == 101
  	end

  	it "should return 150 for input of (100, 50)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(100, 50).should == 150
  	end

  	it "should return 0 for input of (0, 50)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(0, 50).should == 0
  	end

  	it "should return 112.1 for input of (100, 12.1)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(100, 12.1).should == 112.1
  	end

  	it "should return 101.32 for input of (100.32, 1)" do
  		a = TaxCalculatorController.new()
  		a.calculate_tax(100, 12.1).should == 112.1
  	end

  end

end
