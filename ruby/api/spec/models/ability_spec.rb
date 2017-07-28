require "rails_helper"
require "cancan/matchers"

describe Ability do
  subject(:ability) { described_class.new(tester) }

  let (:guest_user) { FactoryGirl.build(:guest_user) }
  let (:admin_user) { FactoryGirl.build(:admin_user) }
  let (:user) { FactoryGirl.build(:user) }

  let (:author_by_guest_user) { FactoryGirl.build(:author, creator: guest_user) }
  let (:author_by_user) { FactoryGirl.build(:author, creator: user) }

  context "for guest user" do
    let (:tester) { guest_user }

    it { is_expected.to be_able_to(:show, author_by_guest_user) }
    it { is_expected.to be_able_to(:show, author_by_user) }
    it { is_expected.to be_able_to(:show, Author.all) }

    it { is_expected.not_to be_able_to(:update, author_by_guest_user) }
    it { is_expected.not_to be_able_to(:update, author_by_user) }
    it { is_expected.not_to be_able_to(:create, Author.new) }
    it { is_expected.not_to be_able_to(:destroy, author_by_user) }
  end

  context "for normal user" do
    let (:tester) { user }

    it { is_expected.to be_able_to(:show, author_by_guest_user) }
    it { is_expected.to be_able_to(:show, author_by_user) }
    it { is_expected.to be_able_to(:show, Author.all) }

    it { is_expected.not_to be_able_to(:update, author_by_guest_user) }
    it { is_expected.to be_able_to(:update, author_by_user) }
    it { is_expected.to be_able_to(:create, Author.new) }
    it { is_expected.not_to be_able_to(:destroy, author_by_guest_user) }
    it { is_expected.to be_able_to(:destroy, author_by_user) }
  end

  context "for admin" do
    let (:tester) { admin_user }

    it { is_expected.to be_able_to(:show, author_by_guest_user) }
    it { is_expected.to be_able_to(:show, author_by_user) }
    it { is_expected.to be_able_to(:show, Author.all) }

    it { is_expected.to be_able_to(:update, author_by_guest_user) }
    it { is_expected.to be_able_to(:update, author_by_user) }
    it { is_expected.to be_able_to(:create, Author.new) }
    it { is_expected.to be_able_to(:destroy, author_by_guest_user) }
    it { is_expected.to be_able_to(:destroy, author_by_user) }
  end

end
