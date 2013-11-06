require 'digest/sha1'
require 'feedzirra'

class Feed < ActiveRecord::Base
	has_many :feed_entries

	def self.new_entry(feed_url)
			# get the url data
			feed = Feedzirra::Feed.fetch_and_parse(feed_url)
			
			#if url is bad
			return -1 if feed == nil; feed == 0

			#check existence in database
			if !exists? :guid => Digest::SHA1.hexdigest(feed.url)
				create!(
					:name 					=> feed.title,
					:url 						=> feed_url,
					:guid						=> Digest::SHA1.hexdigest(feed.url)
				)
				FeedEntry.add_once(feed_url)
				return 1
			else
				return -1
			end
	end
end
