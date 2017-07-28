require 'test/unit'

class TestRules < Test::Unit::TestCase

  def test_create_incorrect_rule
    assert_raise(RuntimeError) do
      r = Rule.new("AB", 2)
    end

    assert_raise(RuntimeError) do
      r = Rule.new(42, 2)
    end

    assert_raise(RuntimeError) do
      r = Rule.new("A", -2)
    end
  end

  def test_meaninless_discount
    assert_raise(RuntimeError) do
      r = Rule.new("A", 20).add_discount(2, 60)
    end
  end

end