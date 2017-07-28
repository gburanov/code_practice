require "./lib/tasks/task_executor"
require "./lib/tasks/find_distance_task"
require "./lib/tasks/shortest_path_task"
require "./lib/tasks/trips_with_max_stops_task"
require "./lib/tasks/trips_with_exact_stops_task"
require "./lib/tasks/trips_with_max_distance_task"

describe Task do
  before do
    @executor = TaskExecutor.new("input.txt")
  end

  it "executes 1 task" do
    task = FindDistanceTask.new("A", "B", "C")
    expect(task.execute(@executor)).to eq 9
  end

  it "executes 2 task" do
    task = FindDistanceTask.new("A", "D")
    expect(task.execute(@executor)).to eq 5
  end

  it "executes 3 task" do
    task = FindDistanceTask.new("A", "D", "C")
    expect(task.execute(@executor)).to eq 13
  end

  it "executes 4 task" do
    task = FindDistanceTask.new("A", "E", "B", "C", "D")
    expect(task.execute(@executor)).to eq 22
  end

  it "executes 5 task" do
    task = FindDistanceTask.new("A", "E", "D")
    expect(task.execute(@executor)).to eq nil
  end

  it "executes 6 task" do
    task = TripsWithMaxStopsTask.new("C", "C", 3)
    expect(task.execute(@executor)).to eq 2
  end

  it "executes 7 task" do
    task = TripsWithExactStopsTask.new("A", "C", 4)
    expect(task.execute(@executor)).to eq 3
  end

  it "executes 8 task" do
    task = ShortestPathTask.new("A", "C")
    expect(task.execute(@executor)).to eq 9
  end

  it "executes 9 task" do
    task = ShortestPathTask.new("A", "C")
    expect(task.execute(@executor)).to eq 9
  end

  it "executes 10 task" do
    task = TripsWithMaxDistanceTask.new("C", "C", 30)
    expect(task.execute(@executor)).to eq 7
  end
end
