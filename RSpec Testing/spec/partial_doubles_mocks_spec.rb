# We can also stub just parts of an existing object's behavior

class Customer
  def self.find
  end
  def self.all
  end
end

RSpec.describe "Partial doubles and mocks" do
  it 'Specify certain behavior to existing classes' do
    time  = Time.new
    fixed = Time.new(2010, 1, 1, 12, 0, 0)
    allow(time).to receive(:year).and_return 2001
    allow(Time).to receive(:now).and_return(fixed)

    expect(time.year).to eq(2001)
    expect(Time.now.year).to eq(2010)
  end

  it 'can stub database calls' do
    dbl = double("Mock Customer")
    allow(dbl).to receive(:name).and_return "Bob"
    allow(Customer).to receive(:find).and_return dbl

    customer = Customer.find
    expect(customer.name).to eq "Bob"

    customer1 = double("John", name: "John")
    customer2 = double("Mary", name: "Mary")
    allow(Customer).to receive(:all).and_return [customer1, customer2]

    all = Customer.all
    expect(all[0].name).to eq "John"
  end

  it 'can stub methods on existing classes 2' do
    str = String.new "Foooo"
    dbl = double(str, :size => 10)
    expect(dbl.size).to eq 10
  end
end
