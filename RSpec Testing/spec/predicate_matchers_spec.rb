class Product
  def price
    100
  end
  def sent?
    true
  end

  def out_of_stock?
    false
  end

  def has_sku?
    true
  end

  def has_late_fees?
    false
  end
end

RSpec.describe "Predicate matchers" do
  product = Product.new
  it "Can generate predicate matchers on the fly for testing (based on object methods)!" do
    expect(product).to be_sent
    expect(product).not_to be_out_of_stock
  end

  it "Can also check if objects have certain things" do
    expect(product).to have_sku
    expect(product).not_to have_late_fees
  end
end
