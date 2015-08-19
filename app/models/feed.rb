class Feed < ActiveRecord::Base

  def self.parse(url)
    feeds = Feedjira::Feed.fetch_and_parse(url)
    @feeds_hash = {}
    feeds.entries.each do |feed|
      @feeds_hash["#{feed.title}"] = feed.summary
    end
    @feeds_hash
  end

  def self.search(url, query)
    feeds = parse(url)
    searched_content = []
    feeds.entries.each do |feed|
      searched_content.push(feed) if feed.match query
    end
    searched_content
  end

  def self.sort
    @feeds_hash.sort
  end
end
