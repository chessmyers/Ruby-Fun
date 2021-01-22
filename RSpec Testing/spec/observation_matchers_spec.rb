class Foo
  attr_reader :value
  def initialize
    @value = 0
  end

  def add
    @value += 1
  end

  def mess_up
    fail RuntimeError
  end
end

RSpec.describe "Observation Matchers" do
  it "Can detect an element added to an array" do
    array = [1,2,3]
    expect{array << 4}.to change(array, :size).from(3).to(4)

    empty = []
    expect{empty << 1}.to change(empty, :empty?).from(true).to false
  end

  it "Can detect changes to objects" do
    foo = Foo.new
    expect{foo.add}.to change(foo, :value).from(0).to 1

    # Can also look at relative changes
    foo2 = Foo.new
    expect{foo2.add}.to change(foo2, :value).by 1
  end

  it "Can check if we raise errors" do
    foo = Foo.new
    expect{foo.mess_up}.to raise_error RuntimeError
    expect{ 1 / 0 }.to raise_error ZeroDivisionError
  end
end
