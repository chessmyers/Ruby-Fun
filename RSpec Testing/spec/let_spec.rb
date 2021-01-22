class Dog
  attr_accessor :fullness

  def initialize
    @fullness = 0
  end

  def eat
    @fullness += 1
  end
end
RSpec.describe "Let Method" do
  # LAZILY executed (only runs when we need it)
  # Let actually creates a helper method that will return the result of the code in the block
  # If it has not yet been created
  let(:dog) { Dog.new }

  # EAGERLY executed--runs right away
  let!(:dog2) { Dog.new }

  it 'can eat food' do
    expect{dog.eat}.to change(dog, :fullness).by 1
  end
end
