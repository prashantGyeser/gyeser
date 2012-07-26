require 'spec_helper'

describe "HomePage" do
	before {visit root_path}

	search_term = 'Banjara Hills'
	
	it {page.should have_selector('title', :text => 'Gyeser | Online food ordering simplified')}
	it {page.should have_selector('input', :name => 'search')}

	# Filling in the form and checking if it redirects to the right page
	it "should be able to fill in a search value in the search field" do
		puts "The current url is:#{current_path}"
		page.should have_selector('input', :name => 'search')
		fill_in '#search', :with => search_term
		#fill_in :input, :with => 'Banjara Hills'
		click_button "Search"

		uri = URI.parse(current_url)
		
		uri.path.should == restaurants_path

		puts "The current url after the button click is:#{current_url}"
		puts "The url after clicking the button is:#{uri.path}?#{uri.query}"
		puts "Rest path is:#{restaurants_path(:search => 'Banjara Hills')}"
	end

end