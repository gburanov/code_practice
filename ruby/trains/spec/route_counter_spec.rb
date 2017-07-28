require "./lib/route_counter"

describe RouteCounter do
  context "more complicated" do
    let (:simple_graph) do
      DirectedGraph.new.tap do |graph|
        graph.connect("A", "B", 4)
        graph.connect("B", "C", 2)
        graph.connect("C", "C", 2)
        graph.connect("C", "D", 6)
        graph.connect("D", "Z", 6)
        graph.connect("A", "D", 10)
      end
    end

    it "path A-C max" do
      subject = described_class.new(simple_graph, "A", "C")
      expect(subject.with_max_stops(4).length).to eq 3
    end

    it "path A-C exact" do
      subject = described_class.new(simple_graph, "A", "C")
      expect(subject.with_exact_stops(4)).to eq [["A", "B", "C", "C", "C"]]
    end

    it "path A-C distance" do
      subject = described_class.new(simple_graph, "A", "C")
      expect(subject.with_max_distance(9).length).to eq 2
    end
  end
end
