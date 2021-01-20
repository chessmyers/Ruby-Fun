require 'rspec'
require_relative '../test_helper.rb'

def new_product(image_url)
  Product.new(title: "My Book Title",
              description: "yyy",
              price: 1,
              image_url: image_url)
end

RSpec.describe Product do
  it 'Creates a Product class' do
    product = Product.new
    expect(product).to be_kind_of(Product)
  end

  it "Doesn't allow for empty fields" do
    product = Product.new
    expect(product).to be_invalid
    expect(product.errors[:title]).to eq ["can't be blank"]
    expect(product.errors[:price]).to eq ["is not a number"]
    expect(product.errors[:description]).to eq ["can't be blank"]
    expect(product.errors[:image_url]).to eq ["can't be blank"]
  end

  it "requires a positive price" do
    product = Product.new(title: "My Book Title",
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.price = -5
    expect(product.invalid?).to be_truthy
    expect(product.errors[:price]).to eq ["must be greater than or equal to 0.01"]

    product.price = 0
    expect(product.invalid?).to be_truthy
    expect(product.errors[:price]).to eq ["must be greater than or equal to 0.01"]

    product.price = 1
    expect(product.valid?).to be_truthy
  end

  it "takes a valid image URL" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      expect(new_product(image_url).valid?).to be true
    end

    bad.each do |image_url|
      expect(new_product(image_url).invalid?).to be true
    end

  end
end