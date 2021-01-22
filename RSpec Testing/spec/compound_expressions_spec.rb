RSpec.describe "Compound Expressions" do
  it "Can chain expression statements" do
    expect(5).to be_odd.and be < 6
    expect("foo").to start_with("f").and include("oo")
    expect("bar").to end_with("x").or start_with("ba")
    # Can also use aliases &, |
    expect("foo").to start_with("f") & include("oo")
    expect("bar").to end_with("x") | start_with("ba")
    # Could also just use satisfy, but bad practice apparantly
    expect(100).to satisfy{ |n| n < 101 && n.even? }
  end

  it "Can compose matchers" do
    array = %w[banana apple orange]
    # The array starts with an element that in turn starts with "ban"
    expect(array).to start_with(start_with "ban")
    # We can also use an alias for readability
    expect(array).to start_with(a_string_starting_with "ban")

    array2 = [10,20,30]
    expect(array2).to end_with(be > 25).and start_with(satisfy {|n| n % 5 == 0})
  end
end
