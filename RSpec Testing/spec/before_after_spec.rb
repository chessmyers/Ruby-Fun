class Car
  attr_accessor :make
  def initialize
    @make = "Honda"
  end
end

describe 'Car' do
  describe "attributes" do
    before(:example) do
      @car = Car.new
    end
    it 'allows writing of make' do
      @car.make= "Toyota"
      expect(@car.make).to eq("Toyota")
    end
    it 'allows reading of make' do
      # This should be honda because the car is created before each example
      expect(@car.make).to eq "Honda"
    end
  end
end
