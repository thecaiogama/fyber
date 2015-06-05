require 'spec_helper'

describe "APP" do
  module RSpecMixin
    include Rack::Test::Methods
    def app() Sinatra::Application end
  end

  include Rack::Test::Methods
  include RSpecMixin

  describe "GET /" do

    before do
      get '/'
    end

    it { expect(last_response).to be_ok}
    it { expect(last_response.status).to eq 200 }
    it { expect(last_response.body).to include "Hello"}
  end
end
