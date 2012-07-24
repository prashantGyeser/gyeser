require "spec/helper"

describe "users registration" do 
	it "allows new users to register with their email address and password" do
		visit users_sign_up_path

		fill_in "Email"									:with => "prashant@gyeser.com"
		fill_in "Password"							:with => "password@123"
		fill_in "Password confirmation"	:with => "password@123"

		page.should have_content("Welcome! You have signed up")
	end	
end