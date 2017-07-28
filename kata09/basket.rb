class Basket
  attr_reader :rules

  def initialize rules
    @rules = rules

    # this can be also optimized to create on demand
    @products = Hash.new
    rules.each_value do |rule|
      @products[rule.product] = ProductBasket.new rule
    end
  end

  def add product
    if rules.has_key? product
      @products[product].add
    end
  end

  def show_total
    sum = 0
    @products.each_value do |product_basket|
      sum += product_basket.show_total
    end
    sum
  end

end

class ProductBasket
  attr_reader :rule

  def initialize rule
    @rule = rule
    @items = 0
  end

  # add single product to cart
  def add
    @items += 1
  end

  def show_total
    total = 0
    items = @items
    if not rule.discount.nil?
      arr = rule.discount.process(@items)
      items = arr[0]
      total = arr[1]
    end
    total += items * rule.price

    total
  end

end