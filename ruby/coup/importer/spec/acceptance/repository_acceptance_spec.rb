require_relative "../../repository"

describe Repository do
  subject { Repository.new("https://cran.r-project.org/src/contrib/") }

  let!(:packages) do
    WebMock.allow_net_connect!
    ret = []
    subject.parse do |package|
      ret << package
      break if ret.length == 4
    end
    ret
  end

  context "Parses first package" do
    let (:package) { packages[0] }

    it { expect(package.name).to eq "A3" }
    it { expect(package.version).to eq "1.0.0" }
  end

  context "Parses second package" do
    let (:package) { packages[1] }

    it { expect(package.name).to eq "abbyyR" }
    it { expect(package.version).to eq "0.5.1" }
  end

  context "Parses 3rd package" do
    let (:package) { packages[2] }

    it { expect(package.name).to eq "abc" }
    it { expect(package.version).to eq "2.1" }
  end
end
