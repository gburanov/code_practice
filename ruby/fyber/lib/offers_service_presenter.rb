require "./lib/offers_service"

class OffersServicePresenter
  rattr_initialize [:uid!, :pub0, :page]
  attr_reader :fetch_error

  def success?
    responce
    fetch_error.nil? && responce.code < 400 && json["code"] == "OK"
  end

  def offers
    return [] unless success?
    json["offers"]
  end

  def error
    return nil if success?
    return fetch_error unless fetch_error.nil?
    json["message"]
  end

  def pages
    return [] unless success?
    (1..json["pages"])
  end

  private

  def json
    JSON.parse(responce.body)
  end

  def responce
    @ret ||= OffersService.new(uid: uid, pub0: pub0, page: page).fetch
  rescue Exception => e
    @fetch_error = e.message
  end
end
