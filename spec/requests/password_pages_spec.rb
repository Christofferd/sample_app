require 'spec_helper'

describe "Password resets pages" do
	subject { page }

	describe "Reset pasword page" do
		before { visit new_password_reset_path }

		it { should have_selector('h1', text: 'Reset password') }
		it { should have_selector('title', text: 'Reset password') }
  end

  describe "Resetting a password" do
  	before { visit new_password_reset_path }

  	describe "with or without entering an email address" do
  		before { click_button "Reset password" }

  		it { should have_selector('div.alert.alert-success') }
  	end
  end
end