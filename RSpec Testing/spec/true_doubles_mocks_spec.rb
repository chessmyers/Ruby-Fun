# Double/mock: an example object preprogrammed with expected expectations and responses
# for the calls it will receive
#
# Stub: An instruction to an object to return a specific response to a method call
# (basically a fake method)

describe "TRUE Doubles and Mocks" do
  it 'allows setting responses' do
    dbl = double("Talk!")
    allow(dbl).to receive(:woof) { "Woof" }
    allow(dbl).to receive(:faint) { fail RuntimeError }
    expect(dbl.woof).to eq "Woof"
    expect{dbl.faint}.to raise_error RuntimeError
  end
  it "allows an alternate syntax to setitng responses" do
    # As always, we have an alternative syntax:
    dbl = double("Talk!")
    allow(dbl).to receive(:run).and_return("Let's go!")
    expect(dbl.run).to eq "Let's go!"
  end

  it "allows setting multiple messages at once" do
    # We can also set multiple messages at once
    sun = double("Sun")
    allow(sun).to receive_messages(
                      rise: :bright,
                      set:  :dark,
                      burn: :hot
                  )
    expect(sun.rise).to eq :bright
    expect(sun.set).to eq :dark
    expect(sun.burn).to eq :hot
  end

  it "Allows setting expectations when we create the double" do
    # Or we can set expectations when we create the double
    cat = double("Meow", :purr => "Meow", :run => "Wheee")
    expect(cat.purr).to eq "Meow"
    expect(cat.run).to eq "Wheee"
  end

  it "Allows simulating random responses" do
    # We are simulating a "random" die that will return 1,6,2, and 3 in sequence
    die = double("die")
    allow(die).to receive(:roll).and_return(1,6,2,3)
    expect(die.roll).to eq 1
    expect(die.roll).to eq 6
    expect(die.roll).to eq 2
    expect(die.roll).to eq 3 # Just continues to return the last response
    expect(die.roll).to eq 3
    expect(die.roll).to eq 3
  end
end