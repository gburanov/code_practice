require_relative "../graph_factory"
require_relative "../shortest_path"

require "byebug"

class TaskExecutor
  attr_reader :graph
  attr_accessor :number
  attr_accessor :tasks

  def initialize filename
    @number = 0
    @graph = GraphFactory.from_file(filename)
    @tasks = []
  rescue Errno::ENOENT
    raise "#{filename} not found"
  end

  def << task
    task.graph = graph
    tasks << task
  end

  def run
    tasks.each do |task|
      @number += 1
      result = task.run
      result = "NO SUCH ROUTE" unless result
      puts "Output #{number}: #{result}"
    end
  end
end
