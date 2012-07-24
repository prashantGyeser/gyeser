require 'spec_helper'

describe "HomePage" do
	subject {page}
	before {visit root_path}

	it {should have_selector('title', :text => 'Gyeser | Online food ordering simplified')}
	it {should have_selector('input', :name => 'search')}

	# Filling in the form and checking if it redirects to the right page
	it "should be able to fill in a search value in the search field" do
		visit root_path
		page.should have_selector('input', :name => 'search')
		find(:css, "search").set('Banjara Hills')
		#fill_in :input, :with => 'Banjara Hills'
		click_button
	end

end