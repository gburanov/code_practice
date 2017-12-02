require "./repository"
require "webmock/rspec"

describe Repository do
  before do
    stub_request(:get, "https://example.com/PACKAGES").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => File.read("spec/fixtures/PACKAGES"), :headers => {})
  end

  subject { Repository.new("https://example.com") }

  context "read packages" do

  let(:first_package) do
    subject.parse do |package|
      return package
    end
  end


  it {
    factory = double("Package factory", extract: true)

    expect(factory).to receive(:extract).twice

    allow(PackageFactory).to receive(:new).with("A3", "1.0.0", "https://example.com").
      and_return factory

    allow(PackageFactory).to receive(:new).with("abbyyR", "0.3", "https://example.com").
      and_return factory

    expect { |b| subject.parse(&b) }.to yield_control.twice
  }
  end
end
