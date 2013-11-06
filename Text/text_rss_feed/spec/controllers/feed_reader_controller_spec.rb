require 'spec_helper'

describe FeedReaderController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST #index" do
	    it "responds successfully with an HTTP 200 status code" do
	      post "index"
	      expect(response).to be_success
	      expect(response.status).to eq(200)
	    end

	    it "should not have empty params when there is data inserted" do
		  post 'index' , :feed_url => "http://news.google.com/?output=rss"
		  controller.params[:feed_url].should_not be_nil
		  controller.params[:feed_url].should eql 'http://news.google.com/?output=rss'
		end

		it "response title should be ok" do
		  post 'index' , :feed_url => "http://news.google.com/?output=rss"
		  assigns(:response).title.should == "Top Stories - Google News"
		  assigns(:response).url.should == "http://news.google.com/news?pz=1&ned=us&hl=en"
		end

		it "response url should be ok" do
		  post 'index' , :feed_url => "http://news.google.com/?output=rss"
		  assigns(:response).url.should == "http://news.google.com/news?pz=1&ned=us&hl=en"
		end
		
		# it "response title should be ok" do
		#   post 'index' , :feed_url => "http://www.sciencemag.org/site/rss/"
		#   assigns(:response).title.should == "Top Stories - Google News"
		#   assigns(:response).url.should == "http://news.google.com/news?pz=1&ned=us&hl=en"
		# end
	end

end
