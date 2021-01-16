require_relative '../src/fizzbuzz'

RSpec.describe FizzBuzz do
  it 'Creates a FizzBuzz class' do
    fizzbuzz = FizzBuzz.new
    expect(fizzbuzz).to be_kind_of(FizzBuzz)
  end

  it 'has a method called output' do
    fizzbuzz = FizzBuzz.new
    expect(fizzbuzz).to respond_to(:output)
  end

  it 'says buzz when given multiple of 5' do
    fizzbuzz = FizzBuzz.new
    expect(fizzbuzz.output 10).to eq "buzz"
    expect(fizzbuzz.output 5).to eq "buzz"
  end
end
