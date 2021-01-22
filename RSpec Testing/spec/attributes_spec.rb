class Person
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

RSpec.describe "Attributes" do
  it "Can expect objects to have certain attributes" do
    person = Person.new "Bob", "Ruby", 10
    expect(person).to have_attributes(:first_name => "Bob")
    expect(person).not_to have_attributes(:first_name => "Job")
  end
end
