require 'spec_helper'

describe "APP" do
  describe "GET /" do

    before do
      get '/'
    end

    it { expect(last_response).to be_ok}
    it { expect(last_response.status).to eq 200 }
    it { expect(last_response.body).to include "Hello"}
  end
end
