require 'spec_helper'

describe Supplierproduct do

  before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.save
		@supplier = @user.suppliers.new(name: "Example Supplier", address: "Example address 1", address2: "Example address 2", zip_code: "1234", city: "Palo Alto", country: "Terra Nova", mail: "supplier@example.com", currency: "GBP")
		@supplierproduct = @supplier.supplierproducts.new(sku: "3333", name: "MacBook Pro", ean: "0885909533923", stock: "2", price: "100")
  end

  subject { @supplierproduct }

  it { should respond_to(:sku) }
  it { should respond_to(:name) }
  it { should respond_to(:ean) }
  it { should respond_to(:stock) }
  it { should respond_to(:price) }
  
  it { should be_valid }
end