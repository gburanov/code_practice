require "./lib/directed_graph"

describe DirectedGraph do
  context "with simple connection" do
    before do
     subject.connect("A", "B", 4)
    end

    it "shows A and B are connected" do
      expect(subject.distance("A", "B")).to eq 4
    end

    it "show B and C are not connected" do
      expect(subject.distance("B", "C")).to eq nil
    end

    it "shows neighbors" do
      expect(subject.neighbors("A")).to eq ["B"]
      # only one directional
      expect(subject.neighbors("B")).to eq []
    end

    it "exists edge between A and B" do
      expect(subject.edge("A", "B")).not_to eq nil
    end
  end
end
