RSpec.describe "Message expectations" do
  it "Expects a call and allows a response" do
    dbl = double("Chant")
    expect(dbl).to receive(:hey!).and_return "Ho!"
    dbl.hey!

    g = BasicObject.new
  end

  it "Does not matter in which order" do
    dbl = double("Multi step process")
    expect(dbl).to receive(:step1)
    expect(dbl).to receive(:step2)

    dbl.step2
    dbl.step1
  end

  it "Can specify an order, however" do
    dbl = double("Multi step process with certain order")
    expect(dbl).to receive(:step1).ordered
    expect(dbl).to receive(:step2).ordered

    dbl.step1
    dbl.step2
  end
end

RSpec.describe "Message argument constraints" do
  it "Can expect to have methods called with certain arguments" do
    # We can specify exactly which argument we want
    dbl = double "Customer List"
    expect(dbl).to receive(:sort).with(:name, :created)
    dbl.sort(:name, :created)

    # we can accept any arguments
    expect(dbl).to receive(:find).with(any_args)
    dbl.find 422

    # We can expect multiple, including of certain types
    expect(dbl).to receive(:map).with(boolean, anything)
    dbl.map(true, 10)

    # We can expect NO arguments
    expect(dbl).to receive(:size).with no_args
    dbl.size
  end

  it "allows for using other matchers" do
    dbl = double("My List")
    expect(dbl).to receive(:reduce).with(
        a_string_starting_with("n"),
        boolean,
        a_string_ending_with("boo")
    )

    dbl.reduce("noo", true, "gooboo")
  end
end
