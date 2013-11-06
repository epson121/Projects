class FeedReaderController < ApplicationController
  def index
  	@feeds = Feed.all
  	feed_url = params[:feed_url]
  	if !feed_url.nil?
  		@resp = Feed.new_entry(feed_url)
	  end
  end
end
