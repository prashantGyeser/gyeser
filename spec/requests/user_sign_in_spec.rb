require "spec_helper"

describe "user sign in" do
  it "allows users to sign in after they have registered" do
    user = User.create(:email    => "prashant@gyeser.com",
                       :password => "password@123")

    visit "/users/sign_in"

    fill_in "Email",    :with => "prashant@gyeser.com"
    fill_in "Password", :with => "password@123"

    click_button "Sign in"

    current_path.should == new_restaurant_path
  end 
end