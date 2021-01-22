RSpec.describe 'Collection Matchers' do
  array1 = [1,2,3]
  array2 = [10,20,30]
  string1 = "RubyFun"
  hash1 = {foo: 10, boo: 20}

  it 'can check if arrays include certain values' do
    expect(array1).to include 1, 3
    expect(array1).not_to include 5
  end

  it 'can check if arrays start or end with certain values' do
    expect(array1).to start_with 1
    expect(array1).to end_with 3
  end

  it 'can compare arrays, but order matters' do
    expect(array2).to eq [10,20,30]
    expect(array2).not_to eq [20,30,10]
  end

  # When arrays have the same contents but they may not be in the same arer
  it 'can compare just the contents of arrays' do
    expect(array2).to match_array([10,20,30])
    expect(array2).to match_array([30,10,20])
  end

  it 'can also check if strings include certain values' do
    expect(string1).to include "by", "un"
    expect(string1).to start_with "Ruby"
    expect(string1).to end_with "Fun"
  end

  it 'can also ask if hashes include certain keys' do
    expect(hash1).to include :foo, :boo
    expect(hash1).to include :foo => 10
    expect(hash1).not_to include :foo => 100
    expect(hash1).not_to include :goo
  end
end
