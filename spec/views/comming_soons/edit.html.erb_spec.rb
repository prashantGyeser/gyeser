require 'spec_helper'

describe "comming_soons/edit" do
  before(:each) do
    @comming_soon = assign(:comming_soon, stub_model(CommingSoon,
      :email => "MyString",
      :location => "MyString"
    ))
  end

  it "renders the edit comming_soon form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comming_soons_path(@comming_soon), :method => "post" do
      assert_select "input#comming_soon_email", :name => "comming_soon[email]"
      assert_select "input#comming_soon_location", :name => "comming_soon[location]"
    end
  end
end
