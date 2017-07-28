require "digest/sha1"

class QuerySigner
  @@api_key = ENV["FYBER_API_KEY"]

  attr_reader :query, :api_key

  def initialize(query, api_key = @@api_key)
    @api_key = api_key
    @query = query
  end

  def sign
    hashkey = Digest::SHA1.hexdigest(query.
      sort_by {|key, _| key}.
      map {|key, value| "#{key}=#{value}"}.join("&").
      concat("&#{api_key}"))

    query.merge(hashkey: hashkey)
  end
end
