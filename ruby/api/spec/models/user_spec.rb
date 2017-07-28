require "rails_helper"

describe User do
  context "admin" do
    subject { described_class.new(role: "admin") }

    it { is_expected.to be_admin }
    it { is_expected.to be_user }
    it { is_expected.to be_guest }
  end

  context "user" do
    subject { FactoryGirl.build(:user) }

    it { is_expected.not_to be_admin }
    it { is_expected.to be_user }
    it { is_expected.to be_guest }
  end

  context "guest" do
    subject { FactoryGirl.build(:guest_user) }

    it { is_expected.not_to be_admin }
    it { is_expected.not_to be_user }
    it { is_expected.to be_guest }
  end
end
