## Module with all the Feedjira functionality
require 'feedjira'
module FeedjiraWrapper
  def parse_url_feeds(url)
    Feedjira::Feed.fetch_and_parse(url)
  end
end
