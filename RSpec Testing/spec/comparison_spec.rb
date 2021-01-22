RSpec.describe "Comparisons" do
  it 'Can tell if numbers are within a range' do
    expect(5).to be_between(1,10).inclusive
    expect(7).to be_between(4,7).inclusive

    expect(10).not_to be_between(10,20).exclusive
  end

  it 'can tell if numbers are close to each other' do
    expect(100).to be_within(5).of(105)
    expect(1000).not_to be_within(100).of 500
  end

  it 'can tell if ranges cover a certain value' do
    expect(1..10).to cover(10)
    expect(1...20).not_to cover(20)
  end

end
