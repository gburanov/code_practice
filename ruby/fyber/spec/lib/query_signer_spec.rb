require "./lib/query_signer"

describe QuerySigner do
  let(:query) do
    {
      appid: 157,
      uid: "player1",
      device_id: "Mydev",
      locale: "de",
      ip: "109.235.143.113",
      offer_types: 112,
      timestamp: 1461620742,
    }
  end

  let (:hashkey) { "06dac65dda086a2d6ffae73309a64bd9d407cf10" }
  let (:signed_query) { query.merge(hashkey: hashkey) }

  let (:subject) { described_class.new(query) }

  context "signs query" do
    it { expect(subject.sign).to eq signed_query }
  end
end
