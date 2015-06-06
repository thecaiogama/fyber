module Helpers
  module FyberHelper
    include QueryHelper
    include HTTParty

    def show(uid, pub0, page)
      url     = build_url uid, pub0, page
      request = HTTParty.get url

      JSON.parse request.body
    end

    private
    def build_url(uid, pub0, page)
      timestamp = ENV['TIMESTAMP'] || Time.now.to_i
      query          = build_query uid, pub0, page, timestamp
      query_with_api = add_api_key query
      sha1_value     = sha1 query_with_api

      query = add_sha1 query, sha1_value

      "#{ENV['URL']}#{query}"
    end

  end
end
