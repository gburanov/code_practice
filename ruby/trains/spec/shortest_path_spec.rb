require "./lib/shortest_path"

describe ShortestPath do
  let (:subject) { described_class.new(simple_graph) }

  context "with simple connection" do
    let (:simple_graph) do
      DirectedGraph.new.tap do |graph|
        graph.connect("A", "B", 4)
        graph.connect("B", "C", 2)
      end
    end

    it "shows short path A-C" do
      expect(subject.find("A", "C")).to eq 6
    end

    it "shows short path A-B" do
      expect(subject.find("A", "B")).to eq 4
    end

    it "No path A-A" do
      expect(subject.find("A", "A")).to eq nil
    end
  end

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

    it "path A-Z" do
      expect(subject.find("A", "Z")).to eq 16
    end

    it "path Z-A" do
      expect(subject.find("Z", "A")).to eq nil
    end

    it "path C-C" do
      expect(subject.find("C", "C")).to eq 2
    end
  end
end
