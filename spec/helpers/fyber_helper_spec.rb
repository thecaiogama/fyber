require 'spec_helper'

describe Helpers::FyberHelper do
  include Helpers::FyberHelper

  describe ".build_query" do
    let(:query) { "appid=157&device_id=2b6f0cc904d137be2e1730235f5664094b83&ip=109.235.143.113&locale=de&offer_types=112&page=1&ps_time=1433461210&pub0=campaign2&timestamp=1433461210&uid=player1" }

    it { expect(build_query("player1", "campaign2", "1")).to eq query }
  end

end
