RSpec.describe "Object Type and Response Tests" do
  it 'can tell if objects belong to a certain type' do
    # Usually just use this one
    expect(1).to be_instance_of(Integer)
    expect(1).to be_kind_of(Numeric)

    expect(1).not_to be_instance_of(Numeric)

    expect("Foo").to be_a_kind_of(Object)
  end

  it 'can tell if objects respond to certain messages' do
    expect("foo").to respond_to :reverse
    expect(1).not_to respond_to :upcase
  end
end