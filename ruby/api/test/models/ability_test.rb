require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  test "guest abilities" do
    ability = Ability.new(users(:guest))
    assert ability.can?(:show, authors(:one))
    assert ability.can?(:show, authors(:two))
    assert ability.can?(:index, Author.all)

    assert ability.cannot?(:update, authors(:one))
    assert ability.cannot?(:create, Author.new)
    assert ability.cannot?(:destroy, Author.new)
  end

  test "user abilities" do
    ability = Ability.new(users(:user))
    assert ability.can?(:show, authors(:one))
    assert ability.can?(:show, authors(:two))
    assert ability.can?(:index, Author.all)

    assert ability.can?(:update, authors(:one))
    assert ability.can?(:create, Author.new)
    assert ability.cannot?(:destroy, authors(:two))
  end

  test "admin abilities" do
    ability = Ability.new(users(:admin))
    assert ability.can?(:show, authors(:one))
    assert ability.can?(:show, authors(:two))
    assert ability.can?(:index, Author.all)

    assert ability.can?(:update, authors(:one))
    assert ability.can?(:create, Author.new)
    assert ability.can?(:destroy, authors(:two))
  end
end
