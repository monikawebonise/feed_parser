class Feed < ActiveRecord::Base
  def self.parse(url)
    feeds = Feedjira::Feed.fetch_and_parse(url)
    content = []
    feeds.entries.each do |feed|
      content.push(feed.title)
      content.push(feed.summary)
    end
    content
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
    feeds_hash = @feeds_hash
    sorted_hash = {}
    feeds_hash.sort.map do |key, val|
      sorted_hash["#{key}"] = val
    end
    sorted_hash
  end

  def self.create_feeds(url)
    feeds = parse(url)
    titles = feeds.values_at(* feeds.each_index.select(&:even?))
    summary = feeds.values_at(* feeds.each_index.select(&:odd?))
    @feeds_hash = {}
    titles.size.times do |x|
      @feeds_hash["#{titles[x]}"] = summary[x]
    end
    @feeds_hash
  end
end
