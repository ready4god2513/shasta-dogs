require 'spec_helper'

describe "dogs/show" do
  before(:each) do
    @dog = assign(:dog, stub_model(Dog,
      :avatar => "Avatar",
      :headline => "Headline",
      :information => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Avatar/)
    rendered.should match(/Headline/)
    rendered.should match(/MyText/)
  end
end
