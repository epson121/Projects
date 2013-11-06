class FeedEntry < ActiveRecord::Base
	belongs_to :feeds

	def self.add_once(feed_url, delay = 15.minutes)
		feed = 	Feedzirra::Feed.fetch_and_parse(feed_url)
		return -1 if feed == nil; feed == 0
		add_entries(feed.entries)
	end

	def self.update_feed()
		Feed.all.each do |feed|
			f = Feedzirra::Feed.update(feed)
			add_entries(f.new_entries) if feed.updated?
		end
	end

	def self.add_entries(entries)
		entries.each do |entry|
			unless exists? :guid => entry.id
					create!(
						:name 				=> entry.title,
						:summary 			=> entry.summary,
						:url 					=> entry.url,
						:published_at => entry.published,
						:guid 				=> entry.id
					)
			end
		end
	end

end
