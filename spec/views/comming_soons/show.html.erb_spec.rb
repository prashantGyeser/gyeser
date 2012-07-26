require 'spec_helper'

describe "comming_soons/show" do
  before(:each) do
    @comming_soon = assign(:comming_soon, stub_model(CommingSoon,
      :email => "Email",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/Location/)
  end
end
