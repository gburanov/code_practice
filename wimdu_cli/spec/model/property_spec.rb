require "spec_helper"
require_relative "../../lib/model/property"

describe "Property" do

  it "generates the name" do
    p =  Property.create
    p.save!
    expect(p.name).not_to be_empty
  end

  it "saves even unvalid entries" do
    p =  Property.create
    p[:title] = "Castle Black"
    expect(p.valid?).to be false

    name = p.name
    p.save!

    p = Property.find_by_name(name)
    expect(p).not_to be nil
  end

end