require 'spec_helper'

describe "HomePage" do
  describe "GET /home/index" do
    it "should have the content 'Gyeser'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get home_path
      #response.status.should be(200)
      response.body.should have_content('Gyeser')
    end
  end
end