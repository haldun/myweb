require 'spec_helper'

describe "themes/new.html.erb" do
  before(:each) do
    assign(:theme, stub_model(Theme,
      :site => nil,
      :name => "MyString",
      :description => "MyText",
      :directory => "MyString"
    ).as_new_record)
  end

  it "renders new theme form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => themes_path, :method => "post" do
      assert_select "input#theme_site", :name => "theme[site]"
      assert_select "input#theme_name", :name => "theme[name]"
      assert_select "textarea#theme_description", :name => "theme[description]"
      assert_select "input#theme_directory", :name => "theme[directory]"
    end
  end
end
