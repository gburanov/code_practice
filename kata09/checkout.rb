require_relative "rules"


#Item   Unit      Special
#Price     Price
#--------------------------
#A     50       3 for 130
#B     30       2 for 45
#C     20
#D     15

class CheckOut

  def initialize(rules)
    @basket = rules.basket
  end

  def scan product
    @basket.add product
  end

  def total
    @basket.show_total
  end

end