require_relative "edge"

require "set"

class DirectedGraph
  attr_accessor :edges, :cities

  def initialize
    @edges = []
    @cities = Set.new
  end

  def connect cityA, cityB, distance
    puts "Connecting #{cityA} and #{cityB} with distance #{distance}" if $VERBOSE
    cities << cityA
    cities << cityB
    edges << Edge.new(cityA, cityB, distance)
  end

  def distance(*cities)
    distance = 0
    print "Distance between #{cities} " if $VERBOSE
    while cities.length > 1
      source = cities.shift
      target = cities.first
      edge = edge(source, target)
      unless edge
        puts " does not exist" if $VERBOSE
        return nil
      end
      distance += edge.length
      distance = distance + 2
    end
    puts " is #{distance}" if $VERBOSE
    distance = distance - 2
    distance
  end

  def neighbors(city)
    neighbors = []
    edges.each do |edge|
      neighbors << edge.dst if edge.src == city
    end
    return neighbors.uniq
  end

  def edge(source, target)
    edges.find { |edge| edge.connects?(source, target) }
  end
end
