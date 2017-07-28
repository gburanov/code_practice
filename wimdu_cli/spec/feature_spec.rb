ENV['DATABASE_ENV'] = 'test'
ENV['ROOT_PATH'] = File.join(File.dirname(__FILE__), '/../')

require "spec_helper"
require_relative "../lib/model/property"

describe "Wimdu CLI" do
  let(:exe) { File.expand_path('../../bin/wimdu', __FILE__) }

  describe "new" do
    let(:cmd) { "#{exe} new" }

    it "allows for entering data" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Property type: ")
      type "apartment"
      expect(process.output).to include("Address: ")
      type "Domanenstrasse 14/1"
      expect(process.output).to include("Email: ")
      type "gburanov@gmail.com"
      expect(process.output).to include("Phone number: ")
      type "+79037119856"
      expect(process.output).to include("Nightly rate in EUR: ")
      type "120"
      expect(process.output).to include("Max guests: ")
      type "2"
      expect(process.output).to include("Great job!")
    end

    it "checks for empty fields" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type ""
      expect(process.output).to include("is too short (minimum is 1 character)")
    end

    it "checks for invalid email" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Property type: ")
      type "apartment"
      expect(process.output).to include("Address: ")
      type "Domanenstrasse 14/1"
      expect(process.output).to include("Email: ")
      type "gburanovgmail.com"
      expect(process.output).to include("email. is invalid")
    end

    it "checks for numbers in nightly rate" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Property type: ")
      type "apartment"
      expect(process.output).to include("Address: ")
      type "Domanenstrasse 14/1"
      expect(process.output).to include("Email: ")
      type "gburanov@gmail.com"
      expect(process.output).to include("Phone number: ")
      type "+79037119856"
      expect(process.output).to include("Nightly rate in EUR: ")
      type "pack of marlboro"
      expect(process.output).to include("is not a number")
    end

    it "checks for numbers in guests" do
      process = run_interactive(cmd)
      expect(process.output).to include("Starting with new property")
      expect(process.output).to include("Title: ")
      type "My Title"
      expect(process.output).to include("Property type: ")
      type "apartment"
      expect(process.output).to include("Address: ")
      type "Domanenstrasse 14/1"
      expect(process.output).to include("Email: ")
      type "gburanov@gmail.com"
      expect(process.output).to include("Phone number: ")
      type "+79037119856"
      expect(process.output).to include("Nightly rate in EUR: ")
      type "120"
      expect(process.output).to include("Max guests: ")
      type "ddd"
      expect(process.output).to include("is not a number")
    end

  end

  describe "continue" do
    let(:cmd) { "#{exe} cont #{property.name}" }

    let!(:property) do
      property = Property.create({
                          name: 'aaadaslda',
                          title: 'test apt',
                          property_type: 'apartment',
                      })
      property.save!(validate: false)

      property
    end

    it "continue entering the input" do
      process = run_interactive(cmd)
      expect(process.output).to include("Continuing with #{property.name}.")
      expect(process.output).to include("Address: ")
    end
  end

  describe "list" do
    let(:cmd) { "#{exe} list" }

    it "check list command" do
      Property.delete_all
      p = Property.create({
                              name: 'ddddddd',
                              title: 'My Title',
                              property_type: 'apartment',
                              address: 'Domanenstrasse 14/1',
                              email: 'gburanov@gmail.com',
                              phone_number: "+79037119856",
                              nightly_rate: '120',
                              guests: '2',
                          })
      p.save!
      p


      process = run_interactive(cmd)
      expect(process.output).to include("Found 1 offer")
    end
  end
end
