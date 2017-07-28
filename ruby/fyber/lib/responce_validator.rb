require "digest/sha1"

class ResponceValidator
  @@api_key = ENV["FYBER_API_KEY"]

  attr_reader :api_key

  def initialize(api_key = @@api_key)
    @api_key = api_key
  end

  def validate!(responce)
    signature = responce.headers["x-sponsorpay-response-signature"]
    raise "Invalid responce signature" unless signature === digest(responce)
  end

  private

  def digest(responce)
    Digest::SHA1.hexdigest(responce.body + api_key)
  end
end
