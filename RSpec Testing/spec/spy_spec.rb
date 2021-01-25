class TimePrinter
  def print
    Time.to_s
    Time.to_s
  end
end

RSpec.describe "Spies" do
  it "Expects a call after it is received" do
    dbl = spy("Chant")
    dbl.send_invoice
    dbl.send_invoice
    expect(dbl).to have_received(:send_invoice).twice
  end

  it "Can track calls by other objects" do

    expect(time).to have_received(:to_s).twice
  end
end
