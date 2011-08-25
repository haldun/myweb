require 'spec_helper'

describe "assets/new.html.erb" do
  before(:each) do
    assign(:asset, stub_model(Asset,
      :site => nil,
      :theme => nil,
      :name => "MyString",
      :type => "",
      :content => "MyText",
      :path => "MyString"
    ).as_new_record)
  end

  it "renders new asset form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assets_path, :method => "post" do
      assert_select "input#asset_site", :name => "asset[site]"
      assert_select "input#asset_theme", :name => "asset[theme]"
      assert_select "input#asset_name", :name => "asset[name]"
      assert_select "input#asset_type", :name => "asset[type]"
      assert_select "textarea#asset_content", :name => "asset[content]"
      assert_select "input#asset_path", :name => "asset[path]"
    end
  end
end
