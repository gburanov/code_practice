require "ostruct"
require "delegate"

class OfferPresenter < SimpleDelegator
  def initialize(offer)
    super(OpenStruct.new(offer))
  end

  def types
    offer_types.map{|t| t["readable"]}.join(", ")
  end

  def payout_time
    time_to_payout["readable"]
  end

  def image
    thumbnail["lowres"]
  end
end
