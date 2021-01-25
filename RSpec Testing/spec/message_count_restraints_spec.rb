class Cart
  def restock
  end
  def add(item, number)
  end
  def empty
    add("Food", 1)
    add("Food", 1)
    add("Food", 1)
  end
end

RSpec.describe "Message count restraints" do
  cart = Cart.new
  it "Can expect to receive messages a certain number of times" do
    expect(cart).to receive(:restock).twice
    cart.restock
    cart.restock

    # Doesn't matter whether we call the method or it happens behind the scenes
    expect(cart).to receive(:add).with(kind_of(String), kind_of(Numeric)).exactly(3).times
    cart.empty

  end
end
