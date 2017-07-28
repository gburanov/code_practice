require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "to_s returns last name and first name" do
    @customer = FactoryGirl.build(:customer)
    assert_equal "#{@customer.last_name}, #{@customer.first_name}", @customer.to_s
  end

  test "customer can't be saved without email address" do
    @customer = FactoryGirl.build(:customer, :email => nil)
    assert ! @customer.valid?
  end

  test "email address needs to be unique" do
    @first_customer = FactoryGirl.create(:customer)
    @customer = FactoryGirl.build(:customer, :email => @first_customer.email)

    @customer.valid?
    assert_equal 1, @customer.errors[:email].length
  end
end
