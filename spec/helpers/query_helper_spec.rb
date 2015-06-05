require 'spec_helper'

describe Helpers::QueryHelper do
  include Helpers::QueryHelper

  let(:main_query) { build_query "player1", "campaign2", "1" }

  describe ".build_query" do
    let(:query) { "appid=157&device_id=2b6f0cc904d137be2e1730235f5664094b83&ip=109.235.143.113&locale=de&offer_types=112&page=1&ps_time=1433461210&pub0=campaign2&timestamp=1433461210&uid=player1" }

    it { expect(build_query("player1", "campaign2", "1")).to eq query }
  end

  describe ".add_api_key" do
    let(:query) do
      add_api_key main_query
    end

    it { expect(query).to include ENV['API_KEY']}
  end

  describe ".sha1" do
    let(:query) do
      query = add_api_key main_query
      sha1 query
    end

    it { expect(query).to eq "527174bd91d296a274bda41e6a47ffe1492afde7" }
  end

  describe ".add_sha1" do
    let(:sha1_value) do
      query = add_api_key main_query
      sha1 query
    end

    it { expect(add_sha1(main_query, sha1_value)).to include "&hashkey=527174bd91d296a274bda41e6a47ffe1492afde7" }
    it { expect(add_sha1(main_query, sha1_value)).to_not include ENV['API_KEY'] }

  end

end
