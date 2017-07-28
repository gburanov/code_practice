require_relative "task"

class ShortestPathTask < Task
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def run
    ShortestPath.new(graph).find(start, finish)
  end
end
