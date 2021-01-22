class Food
  attr_accessor :stale

  def initialize
    @stale = false
  end

  def expire
    @stale = true
  end
end

RSpec.describe "Subject" do
  # Instead of writing this:
  # let(:car) { Car.new }
  #
  # We can rename the method to 'subject' and use a shorthand:
  # subject { Car.new }
  # This inits it lazily...
  subject { Food.new }
  # And this is eager
  subject! {Food.new}

  it "Can expire" do
    expect{subject.expire}.to change(subject, :stale).to(true)
  end

  describe Food do
    # We are guessing that subject is the class we are describing--Food
    it "Can use implicitly defined subjects too!" do
      expect(subject.stale).to be false
    end
  end

end