require 'spec_helper'

describe Order do

  before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.save
		@order = @user.orders.new(number: "123", date: "2012-01-01", payment: "VISA", name: "Example Customer", address: "Example Address 1", address2: "Example Address 2", zip_code: "1234", city: "Gotham", country: "Neverland", mail: "customer@example.com", phone: "12345678")
  end

  subject { @order }

  it { should respond_to(:number) }
  it { should respond_to(:date) }
  it { should respond_to(:payment) }
  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:mail) }
  it { should respond_to(:phone) }

  it { should be_valid }

	describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Order.new(user_id: "1")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "accessible attributes" do
    it "should not allow access to state" do
      expect do
        Order.new(state: "closed")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  	describe "when user_id is not present" do
		before { @order.user_id = " " }
		it { should_not be_valid }
	end

	describe "when order number is not present" do
		before { @order.number = " " }
		it { should_not be_valid }
	end
end