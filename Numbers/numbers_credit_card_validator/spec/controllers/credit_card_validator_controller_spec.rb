require 'spec_helper'

describe CreditCardValidatorController do
	describe "POST #index" do
	    it "responds successfully with an HTTP 200 status code" do
	      post "index"
	      expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "should not have empty params when there is data inserted" do
		  post 'index' , :ccnumber => "5555555555554444"
		  controller.params[:ccnumber].should_not be_nil
		  controller.params[:ccnumber].should eql '5555555555554444'
		end

		it "should return 'Nice!! Your number seems to be fine.. :)' when fine number is posted" do
		  post 'index' , :ccnumber => "5555555555554444"
		  assigns(:message).should == "Nice!! Your number seems to be fine.. :) "
		end

		it "should return 'Oooh. :( Wrong number.' when wrong number is posted" do
		  post 'index' , :ccnumber => "512323355555123124"
		  assigns(:message).should == "Oooh. :( Wrong number."
		end

		it "should return 'You funny kid. Enter a number! ' when no number is posted" do
		  post 'index' , :ccnumber => "asdasdasdas"
		  assigns(:message).should == "You funny kid. Enter a number! "
		end

		it "should return 'You funny kid. Enter a number! ' when no entry is posted" do
		  post 'index' , :ccnumber => ""
		  assigns(:message).should == "You funny kid. Enter a number! "
		end

	end

	describe "GET #index" do
		it "responds successfully with an HTTP 200 status code" do
			get "index"
		    expect(response).to be_success
		    expect(response.status).to eq(200)
		end
	end

	describe "Luhns algorithm" do
		it "Should return false with bad input" do 
			a = CreditCardValidatorController.new()
			@a = a.luhns(8798)	
			@a.should == false
		end

		it "Should return true with ok input" do 
			a = CreditCardValidatorController.new()
			@a = a.luhns(5555555555554444)	
			@a.should == true
		end
	end
end
