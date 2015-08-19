require 'spec_helper'

describe UrlActionsController do
  describe 'parse_url' do

    context "when valid url is passed" do
    it "should return feeds in the JSON format" do
      post :parse_url, params ={:url => "http://zeenews.india.com/rss/south-asia-news.xml"}
      response.body.format.should be_JSON
      response.should be_success
      body = JSON.parse(response.body)
    end

end

