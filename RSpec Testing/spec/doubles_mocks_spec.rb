# Double/mock: an example object preprogrammed with expected expectations and responses
# for the calls it will receive
#
# Stub: An instruction to an object to return a specific response to a method call
# (basically a fake method)

describe "Doubles and Mocks" do
  it 'allows setting responses' do
    dbl = double("Talk!")
    allow(dbl).to receive(:woof) { "Woof" }
    allow(dbl).to receive(:faint) { fail RuntimeError }
    expect(dbl.woof).to eq "Woof"
    expect{dbl.faint}.to raise_error RuntimeError

    # As always, we have an alternative syntax:
    allow(dbl).to receive(:run).and_return("Let's go!")
    expect(dbl.run).to eq "Let's go!"
  end
end