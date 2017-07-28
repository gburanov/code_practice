# Cash Units
CASH_UNITS = [500,200,100,50,20,10,5,2,1,0.5,0.2,0.1,0.05,0.02,0.01].freeze

# Given an amount of money, please compute the optimal combination of cash
# units so that the payment can be fulfilled with the least amount of cash
# units for the named amount.
#
# Example: The expected result for 1953.76 should be
# {
#   500 => 3,
#   200 => 2,
#   50 => 1,
#   2 => 1,
#   1 => 1,
#   0.50 => 1,
#   0.20 => 1,
#   0.05 => 1,
#   0.01 => 1
# }

require "byebug"

def try_to_reduce_cash(amount, cash_unit, hash)
   while (amount - cash_unit * 100) >= 0
    #puts "#{amount} #{cash_unit}"
     amount = amount - cash_unit * 100
     hash[cash_unit] += 1
   end
   amount
end

def compute_payment(amount)
  amount = (amount * 100).to_i
  ret = {500 => 0, 200 => 0, 50 => 0, 2 => 0, 1 => 0, 0.50 => 0, 0.20 => 0, 0.05 => 0, 0.01 => 0 }
  CASH_UNITS.each do |cash_unit|
    amount = try_to_reduce_cash(amount, cash_unit, ret)
  end
  ret
end

require 'rspec'

describe Object do
  context "as_sentence works" do
    let (:responce) { {500 => 3, 200 => 2, 50 => 1, 2 => 1, 1 => 1, 0.50 => 1, 0.20 => 1, 0.05 => 1, 0.01 => 1 } }

    it "works" do
      expect(compute_payment(1953.76)).to eq responce
    end
  end
end
