require 'spec_helper'
# require 'rails_helper'
describe Feed do
  describe 'parse' do
    # url = 'http://zeenews.india.com/rss/south-asia-news.xml'
    subject(:parse) { Feed.parse(url) }

    context 'when a valid url is entered' do
      let(:url) { 'http://zeenews.india.com/rss/south-asia-news.xml' }
      it 'should return parsed content' do
        expect(parse).not_to eql(nil)
      end
    end

    # context 'when a invalid url is entered' do
    #   let(:url) { '' }
    #   it 'should raise an error' do
    #     expect(parse).to raise_error(NoMethodError)
    #   end
    # end
  end

  describe 'sort' do
    # url = 'http://zeenews.india.com/rss/south-asia-news.xml'
    context 'when sort called on parsed feeds' do
      before { feeds.instance_variable_set(@feeds_hash, Feed.create_feeds('
        http://timesofindia.feedsportal.com/c/33039/f/533923/index.rss') )}
      let(:feeds_hash) { Feed.sort }
      it 'should return hash' do
        expect(feeds_hash).to be_eql('hash')
      end
    end
  end
end


