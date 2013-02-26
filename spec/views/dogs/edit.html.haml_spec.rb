require 'spec_helper'

describe "dogs/edit" do
  before(:each) do
    @dog = assign(:dog, stub_model(Dog,
      :avatar => "MyString",
      :headline => "MyString",
      :information => "MyText"
    ))
  end

  it "renders the edit dog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dogs_path(@dog), :method => "post" do
      assert_select "input#dog_avatar", :name => "dog[avatar]"
      assert_select "input#dog_headline", :name => "dog[headline]"
      assert_select "textarea#dog_information", :name => "dog[information]"
    end
  end
end
