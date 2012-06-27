require 'spec_helper'

describe Product do

  before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.save
		@product = @user.products.new(sku: "1212", name: "MacBook Pro", stock: "2", price: "10000", ean: "0885909533923")
  end

  subject { @product }

  it { should respond_to(:sku) }
  it { should respond_to(:name) }
  it { should respond_to(:stock) }
  it { should respond_to(:price) }
  it { should respond_to(:ean) }

  it { should be_valid }

	describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Product.new(user_id: "1")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
		before { @product.user_id = " " }
		it { should_not be_valid }
	end

  describe "when sku is not present" do
    before { @product.sku = " " }
    it { should_not be_valid }
  end

	describe "when name is not present" do
		before { @product.name = " " }
		it { should_not be_valid }
	end
end