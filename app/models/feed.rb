class Feed < ActiveRecord::Base

  def self.parse(url)
    feeds = Feedjira::Feed.fetch_and_parse(url)
    feeds_hash = {}
    feeds.entries.each do |feed|
      feeds_hash["#{feed.title}"] = feed.summary
    end
    feeds_hash
  end
end
