require "timecop"

require "./lib/offers_service_presenter"

require "byebug"

describe OffersServicePresenter do
  let (:uid) { "player1" }
  let (:subject) { described_class.new(uid: uid) }
  let(:responce_headers) { {"x-sponsorpay-response-signature" => checksum } }

  before do
    freezed_time = Time.utc(2015, 1, 1, 12, 0, 0) #Put here any time you want
    Timecop.freeze(freezed_time)

    stub_request(:get, "http://api.fyber.com/feed/v1/offers.json?appid=157&device_id=2b6f0cc904d137be2e1730235f5664094b83&hashkey=4718927379156929c61b4913184873fe1e4cf8f1&ip=109.235.143.113&locale=de&offer_types=112&timestamp=1420113600&uid=player1").
      to_return(:status => 200, :body => responce_body, :headers => responce_headers)
  end

  context "successful query" do
    let(:responce_body) { File.read("spec/fixtures/correct_responce.json") }
    let(:checksum) { "62e0106e0bab223ab123724232503fcbaff323f5" }

    it "shows offers" do
      expect(subject.offers.length).to be 30
      expect(subject.success?).to be true
      expect(subject.error).to be nil
    end

    context "bad checksum" do
      let(:checksum) { "ddd" }
      it { expect(subject.error).to eq "Invalid responce signature" }
      it { expect(subject.success?).to be false }
    end
  end

  context "bad query" do
    let(:responce_body) { File.read("spec/fixtures/error_responce.json") }
    let(:checksum) { "4364591ad5e1d5ca7d2072b8eb637a20b24b6402" }

    it "shows error" do
      expect(subject.offers.length).to be 0
      expect(subject.success?).to be false
      expect(subject.error).to eq "A non-existing page was requested with the parameter page."
    end
  end


  context "empty responce" do
    let(:responce_body) { File.read("spec/fixtures/empty_responce.json") }
    let(:checksum) { "f3d64e29a927640434ea7a8380a659788b4a227c" }

    it "shows no offers" do
      expect(subject.offers.length).to be 0
      expect(subject.success?).to be false
      expect(subject.error).to eq "Successful request, but no offers are currently available for this user."
    end
  end
end
