require_relative "directed_graph"

class GraphFactory
  def self.from_file filename
    str = GraphFactory.read_file(filename)
    DirectedGraph.new.tap do |graph|
      str.scan(/([A-Z])([A-Z])(\d+)/) do |source_city, target_city, distance|
        graph.connect source_city, target_city, distance.to_i
      end
    end
  end

  def self.read_file(filename)
    IO.read(filename)
  rescue Errno::ENOENT
    raise "#{filename} not found"
  end
end
