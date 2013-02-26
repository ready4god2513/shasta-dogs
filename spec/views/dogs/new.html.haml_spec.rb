require 'spec_helper'

describe "dogs/new" do
  before(:each) do
    assign(:dog, stub_model(Dog,
      :avatar => "MyString",
      :headline => "MyString",
      :information => "MyText"
    ).as_new_record)
  end

  it "renders new dog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dogs_path, :method => "post" do
      assert_select "input#dog_avatar", :name => "dog[avatar]"
      assert_select "input#dog_headline", :name => "dog[headline]"
      assert_select "textarea#dog_information", :name => "dog[information]"
    end
  end
end
