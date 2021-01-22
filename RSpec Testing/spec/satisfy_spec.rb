class Product
  def price
    100
  end
  def sent?
    true
  end
end

RSpec.describe "Satisfy" do
  product = Product.new
  it "Can use a block to satisfy custom conditions when we don't know what else to use" do
    # If the block returns true, the expect passes otherwise it fails
    expect(50).to satisfy { |v| v < 100 && (v % 10) == 0}

    # We can use a lambda block too!
    product_condition = lambda { |prod| prod.price < 200 && prod.sent?}
    expect(product).to satisfy &product_condition
  end
end
