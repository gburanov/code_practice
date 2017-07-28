class RouteCounter
  attr_reader :graph, :start, :finish

  def initialize graph, start, finish
    @graph = graph
    @start = start
    @finish = finish
  end

  def with_max_stops(stops)
    valid = Proc.new do |stops_, path_|
      path_.length <= stops_ + 1
    end

    traverse(start, finish, stops, valid, lambda(&method(:path_can_be_valid)))
  end

  def with_exact_stops(stops)
    valid = Proc.new do |stops_, path_|
      path_.length == stops_ + 1
    end
    traverse(start, finish, stops, valid, lambda(&method(:path_can_be_valid)))
  end

  def with_max_distance(distance, path = [])
    valid = Proc.new do |distance_, path_|
      graph.distance(*path_) < distance_
    end

    path_can_be_valid = Proc.new do |start_, neighbor_, distance_, path_|
      graph.distance(*path_) + graph.distance(start_, neighbor_) < distance_
    end
    traverse(start, finish, distance, valid, path_can_be_valid)
  end

  private

  def path_can_be_valid(_, _, stops, path)
    path.length < stops + 1
  end

  def traverse(start, finish, num, valid, can_be_valid, path=[])
    path = path + [start]

    return [] unless graph.cities.include? start
    paths = (start == finish && path.length > 1) && valid.call(num, path) ? [path] : []

    graph.neighbors(start).each do |neighbor|
      if can_be_valid.call(start, neighbor, num, path)
        new_paths = traverse(neighbor, finish, num, valid, can_be_valid, path)
        paths = paths + new_paths
      end
    end

    paths
  end
end
