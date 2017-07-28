require "./lib/offer_presenter"
require "json"

describe OfferPresenter do
  let(:offer) { JSON.parse(File.read("spec/fixtures/offer.json")) }
  let(:subject) { described_class.new(offer) }

  context "presents offer" do
    it {expect(subject.title).to eq "Rich Casino - Deposit"}
    it {expect(subject.teaser).to eq "Melde Dich als neuer Benutzer an und zahle mindesten 25€"}
    it {expect(subject.types).to eq "Einkaufen, Spiele, Spiele, Gratis"}
    it {expect(subject.payout_time).to eq "5 Minuten"}
    it {expect(subject.image).to eq "http://cdn2.sponsorpay.com/assets/61579/rich-casino_square_60.png"}
  end
end
