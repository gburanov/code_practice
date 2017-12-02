require "./repository_persister.rb"
require "spec_helper"

describe RepositoryPersister do
  let (:repository) { double("Repository") }
  let (:subject) { described_class.new(repository) }

  let (:package) { Package.new(name: "fake name",
    date: "2015-10-02", title: "Title", description: "Desc", version: "Ver") }

  it "persists repository" do
    allow(repository).to receive(:parse).and_yield(package)

    expect{subject.call(1)}.to change {Package.count}.from(0).to(1)
  end
end
