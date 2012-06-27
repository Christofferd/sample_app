require 'spec_helper'

describe Supplier do

  before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
		@user.save
		@supplier = @user.suppliers.new(name: "Example Supplier", address: "Example address 1", address2: "Example address 2", zip_code: "1234", city: "Palo Alto", country: "Terra Nova", mail: "supplier@example.com", currency: "GBP")
  end

  subject { @supplier }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:address2) }
  it { should respond_to(:zip_code) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:mail) }
  it { should respond_to(:currency) }
  
  it { should be_valid }

	describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Supplier.new(user_id: "1")
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  	describe "when user_id is not present" do
		before { @supplier.user_id = " " }
		it { should_not be_valid }
	end
end