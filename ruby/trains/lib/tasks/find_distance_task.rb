require_relative "task"

class FindDistanceTask < Task
  attr_reader :cities

  def initialize(*cities)
    @cities = cities
  end

  def run
    graph.distance(*cities)
  end
end
