require "sinatra"
require "tilt/erb"
require "./lib/offers_service_presenter"
require "./lib/offer_presenter"

set :bind, "0.0.0.0"

get '/' do
  erb :index
end

get '/offers' do
  @current_page = 0
  @offers = []
  @pages = []
  hash = Hash[params.map{ |k, v| [k.to_sym, v] }].delete_if { |k, v| v.empty? }

  begin
    presenter = OffersServicePresenter.new(hash)
    @offers = presenter.offers
    @error = presenter.error
    @pages = presenter.pages.map do |page|
      page_params = hash.clone
      page_params[:page] = page
      { href: "/offers?#{URI.encode_www_form(page_params)}", text: page.to_s }
    end
    @current_page = params["page"] unless params["page"].to_s.empty?
  rescue Exception => e
    @error = e.message
  end

  erb :offers
end
