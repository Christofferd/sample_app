require 'spec_helper'

describe Orderline do

  before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.save
		@order = @user.orders.new(number: "123", date: "2012-01-01", payment: "VISA", name: "Example Customer", address: "Example Address 1", address2: "Example Address 2", zip_code: "1234", city: "Gotham", country: "Neverland", mail: "customer@example.com", phone: "12345678")
		@orderline = @order.orderlines.new(sku: "1212", name: "MacBook Pro", ean: "0885909533923", qty_ordered: "1", price: "10000")
  end

  subject { @orderline }

  it { should respond_to(:sku) }
  it { should respond_to(:name) }
  it { should respond_to(:ean) }
  it { should respond_to(:qty_ordered) }
  it { should respond_to(:price) }
  
  it { should be_valid }
end