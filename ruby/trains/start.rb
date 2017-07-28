require "./lib/tasks/task_executor"
require "./lib/tasks/find_distance_task"
require "./lib/tasks/shortest_path_task"
require "./lib/tasks/trips_with_max_stops_task"
require "./lib/tasks/trips_with_exact_stops_task"
require "./lib/tasks/trips_with_max_distance_task"

executor = TaskExecutor.new("input.txt")

executor.run
