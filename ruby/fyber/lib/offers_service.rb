require "./lib/query_signer"
require "./lib/responce_validator"

require "httparty"
require "attr_extras"

class OffersService
  include HTTParty
  base_uri "http://api.fyber.com/feed/v1"

  rattr_initialize [:uid!, :pub0, :page]

  def fetch
    responce = self.class.get("/offers.json", query: query)
    ResponceValidator.new.validate!(responce)
    responce
  end

  private

  def query
    QuerySigner.new(unsigned_query).sign
  end

  def unsigned_query
    {
      appid: 157,
      uid: @uid,
      pub0: @pub0,
      page: @page,
      device_id: ENV["FYBER_DEVICE_ID"],
      locale: "de",
      ip: "109.235.143.113",
      offer_types: 112,
      timestamp: Time.now.to_i,
    }.reject{|k,v| v.nil?}
  end
end
