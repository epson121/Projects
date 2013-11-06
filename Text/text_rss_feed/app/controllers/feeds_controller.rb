class FeedsController < ApplicationController
	def index
	end

	def show
		@feed = Feed.find(params[:id])
		@entries = FeedEntry.all
	end
end