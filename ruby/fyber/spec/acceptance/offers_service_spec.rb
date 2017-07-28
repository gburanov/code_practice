require "./lib/offers_service"
# these test do the real server call. Run them to generate contract

WebMock.allow_net_connect!

describe OffersService do
  let(:subject) { described_class.new(input).fetch }

  context "player1 query" do
    let(:input) { {uid: "player1" } }

    it "returns with OK" do
      expect(subject.code).to eq 200
      expect(subject["code"]).to eq "OK"
    end

    it "shows offers" do
      expect(subject["offers"].count).to eq 30
    end
  end

  context "correct page in paginated query" do
    let(:input) { {uid: "player1", page: "2" } }

    it "shows less offers" do
      expect(subject["offers"].count).to be > 0
    end
  end
end
