require 'spec_helper'

describe "dogs/index" do
  before(:each) do
    assign(:dogs, [
      stub_model(Dog,
        :avatar => "Avatar",
        :headline => "Headline",
        :information => "MyText"
      ),
      stub_model(Dog,
        :avatar => "Avatar",
        :headline => "Headline",
        :information => "MyText"
      )
    ])
  end

  it "renders a list of dogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Headline".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
