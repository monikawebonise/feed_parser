class UrlActionsController < ApplicationController
  require 'open-uri'

  def index
  end

  def parse_url
    @feeds = Feed.parse(params[:url])
    render json: @feeds
  end

  def sort_by_title
    @sorted_feeds = Feed.sort
    render json: @sorted_feeds
  end

  def search_by_text
    searched_feeds = Feed.search(params[:url], params[:query])
    render json: searched_feeds
  end
end
# doc = Nokogiri::HTML(open("http://www.threescompany.com/"))
