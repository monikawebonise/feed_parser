class UrlActionsController < ApplicationController
  require 'open-uri'

  def index
  end

  def parse_url
    feeds = Feed.parse(params[:url])
    render json: feeds
  end
end
