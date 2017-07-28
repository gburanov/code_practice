require_relative "task"
require_relative "../route_counter"

class TripsWithMaxDistanceTask < Task
  attr_reader :start, :finish, :distance

  def initialize(start, finish, distance)
    @start = start
    @finish = finish
    @distance = distance
  end

  def run
    RouteCounter.new(graph, start, finish).with_max_distance(distance).length
  end
end
