module Helpers
  module QueryHelper

    def build_query(uid, pub0, page, timestamp)
      "appid=#{ENV['APPID']}&device_id=#{ENV['DEVICE_ID']}&ip=#{ENV['IP']}&locale=#{ENV['LOCALE']}&offer_types=#{ENV['OFFER_TYPES']}&page=#{page}&ps_time=1433461210&pub0=#{pub0}&timestamp=#{timestamp}&uid=#{uid}"
    end

    def add_api_key(query)
      "#{query}&#{ENV['API_KEY']}"
    end

    def sha1(query)
      Digest::SHA1.hexdigest query
    end

    def add_sha1(query, sha1)
      "#{query}&hashkey=#{sha1}"
    end

  end
end
