# I decided to choose Dijkstra - the most popular one
# https://en.wikipedia.org/wiki/Dijkstra's_algorithm

class ShortestPath
  attr_reader :graph

  def initialize(graph)
    @graph = graph
  end

  # nil means does not find it
  def find(start, finish)
    ret = distances(start)[finish]
    return nil if ret == Float::INFINITY
    ret
  end

  private

  def distances(start)
    distances = Hash.new Float::INFINITY
    vertices = graph.cities.clone

    graph.neighbors(start).each do |neighbor|
      distances[neighbor] = graph.distance(start, neighbor)
    end

    until vertices.empty?
      nearest = vertices.min_by { |vertex| distances[vertex] }
      vertices.delete nearest

      break if distances[nearest] == Float::INFINITY

      graph.neighbors(nearest).each do |vertex|
        if (new_distance = distances[nearest] + graph.distance(nearest, vertex)) < distances[vertex]
          distances[vertex] = new_distance
        end
      end
    end
    distances
  end
end
