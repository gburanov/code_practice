require_relative "../package_factory"
require "webmock/rspec"

describe PackageFactory do
  before do
    stub_request(:get, "https://example.com/A3_1.0.0.tar.gz").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read("spec/fixtures/test.tar.gz"), :headers => {})
  end

  context "create correct package" do
    subject { PackageFactory.new("A3", "1.0.0","https://example.com").extract }

    it { expect(subject.name).to eq "A3" }
    it { expect(subject.name).to eq "A3" }
    it { expect(subject.version).to eq "1.0.0" }
    it { expect(subject.date.month).to eq 8 }
  end
end
