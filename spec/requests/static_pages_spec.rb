require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample App')
    end
  end

  describe "Help page" do

    it "should have content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end
  end

    describe "About page" do

    it "should have content 'About Us'" do
      visit '/static_pages/about'
      page.should have_content('About Us')
    end
  end
end