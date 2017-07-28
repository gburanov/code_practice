class Task
  attr_accessor :graph

  def execute(executor)
    executor << self
    run
  end
end
