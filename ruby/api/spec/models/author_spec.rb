require "rails_helper"

describe Author do
  subject { described_class.new }

  let (:book) { FactoryGirl.build(:book) }

  before do
    subject.books << book << book
  end

  context "books size" do
    it "is correct" do
      expect(subject.books.size).to eq 2
    end
  end
end
