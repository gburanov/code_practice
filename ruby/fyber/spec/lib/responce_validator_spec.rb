require "./lib/responce_validator"
require "json"

describe ResponceValidator do
  let(:responce_body) { File.read("spec/fixtures/correct_responce.json") }
  let(:subject) { described_class.new }
  let(:responce_headers) { {"x-sponsorpay-response-signature" => checksum } }
  let(:responce) { double("Responce", :body => responce_body, :headers => responce_headers) }

  context "validates coreect responce" do
    let(:checksum) { "62e0106e0bab223ab123724232503fcbaff323f5" }

    it { subject.validate!(responce) }
  end

  context "does not valide with wrong header" do
    let(:checksum) { "fake_checksum" }

    it { expect { subject.validate!(responce) }.to raise_error(RuntimeError) }
  end
end
