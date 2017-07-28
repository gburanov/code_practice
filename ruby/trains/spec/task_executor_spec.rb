require "./lib/tasks/task_executor.rb"

describe TaskExecutor do

  context "when file not found" do
    let(:file) { "invalid.txt" }

    it "shows correct error message" do
      expect{described_class.new(file)}.to raise_error("#{file} not found") 
    end
  end

end
