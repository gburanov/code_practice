require_relative "basket"

class Rules < Hash

  def add rule
    self[rule.product] = rule
  end

  def basket
    Basket.new self
  end

end

class Rule
  attr_reader :product
  attr_reader :price
  attr_reader :discount

  def initialize product, price, discount = nil
    @product = product
    @price = price
    @discount = nil


    if not product.is_a? String or not product.length == 1
      raise "Incorrect product"
    end

    if price <= 0
      raise "Invalid price"
    end
  end

  def add_discount count, price
    @discount = Discount.new(count, price, self)

    self
  end

end

class Discount
  attr_reader :count
  attr_reader :price
  attr_reader :rule

  def initialize count, price, rule
    @count = count
    @price = price
    @rule = rule

    if price <= 0
      raise "Invalid price"
    end

    if count <= 0
      raise "Invalid count"
    end

    if price >= count * rule.price
      raise "Meaninless discount"
    end
  end

  def process items
    total = 0
    while (items >= count)
      items -= count
      total += @price
    end
    [items, total]
  end

end

RULES = Rules.new
RULES.add Rule.new('A', 50).add_discount(3, 130)
RULES.add Rule.new('B', 30).add_discount(2, 45)
RULES.add Rule.new('C', 20)
RULES.add Rule.new('D', 15)