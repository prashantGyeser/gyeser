require 'spec_helper'

describe "HomePage" do
  describe "GET /home/index" do
    it "should have the content 'Gyeser'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit "home"
      page.should have_selector('title', :text => 'Gyeser | Online food ordering simplified')
      #response.status.should be(200)
      #page.should have_tag('input[search]')
    end

    it 'should have an input with name search' do
    	visit 'home'
    	page.should have_selector('input', :name => 'search')
    end

  end

end