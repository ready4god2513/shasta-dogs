require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :name => "MyString",
      :content => "MyString",
      :active => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_name", :name => "post[name]"
      assert_select "input#post_content", :name => "post[content]"
      assert_select "input#post_active", :name => "post[active]"
    end
  end
end
