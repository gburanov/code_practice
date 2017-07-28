require_relative "task"
require_relative "../route_counter"

class TripsWithExactStopsTask < Task
  attr_reader :start, :finish, :stops

  def initialize(start, finish, stops)
    @start = start
    @finish = finish
    @stops = stops
  end

  def run
    RouteCounter.new(graph, start, finish).with_exact_stops(stops).length
  end
end
