require 'spec_helper'

describe Helpers::FyberHelper do
  include Helpers::FyberHelper

  let(:offers) do
    VCR.use_cassette "offers" do
      show "player1", "campaign2", "1"
    end
  end

  let(:no_offers) do
    VCR.use_cassette "no_offers" do
      show "player1", "campaign2", "1"
    end
  end

  describe ".show" do
    it { expect(offers['count']).to eq 30 }
    it { expect(offers['code']).to eq "OK" }
    it { expect(offers['information']['appid']).to eq 157 }
    it { expect(offers['offers']).to_not be_empty }
  end

  describe ".show with no offers" do
    it { expect(no_offers['count']).to eq 0 }
    it { expect(no_offers['code']).to eq "NO_CONTENT" }
    it { expect(no_offers['information']['appid']).to eq 157 }
    it { expect(no_offers['offers']).to be_empty }
  end


end
