require 'spec_helper'

describe "comming_soons/index" do
  before(:each) do
    assign(:comming_soons, [
      stub_model(CommingSoon,
        :email => "Email",
        :location => "Location"
      ),
      stub_model(CommingSoon,
        :email => "Email",
        :location => "Location"
      )
    ])
  end

  it "renders a list of comming_soons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
