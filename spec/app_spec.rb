require 'spec_helper'

describe "APP" do
  module RSpecMixin
    include Rack::Test::Methods
    def app() FyberApp end
  end

  include Rack::Test::Methods
  include RSpecMixin

  describe "GET /" do

    before do
      get '/'
    end

    it { expect(last_response).to be_ok}
    it { expect(last_response.status).to eq 200 }
    it { expect(last_response.body).to include "User"}
  end

  describe "GET /offers/player1/1/this-is-a-test" do
    before do
      VCR.use_cassette 'get_offers' do
        get '/offers/player1/1/this-is-a-test'
      end
    end

    let(:offers) { JSON.parse(last_response.body) }

    it { expect(last_response).to be_ok }
    it { expect(offers['code']).to eq "NO_CONTENT"}
    it { expect(offers['count']).to eq 0}
  end

  describe "GET /offers/player1/1" do
    before do
      VCR.use_cassette 'get_offers_no_pub0' do
        get '/offers/player1/1'
      end
    end

    let(:offers) { JSON.parse(last_response.body) }

    it { expect(last_response).to be_ok }
    it { expect(offers['code']).to eq "NO_CONTENT"}
    it { expect(offers['count']).to eq 0}
  end
end
