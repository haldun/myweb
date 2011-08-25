require 'spec_helper'

describe "sites/new.html.erb" do
  before(:each) do
    assign(:site, stub_model(Site,
      :name => "MyString",
      :slug => "MyString",
      :title => "MyString",
      :tagline => "MyText",
      :owner => nil
    ).as_new_record)
  end

  it "renders new site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sites_path, :method => "post" do
      assert_select "input#site_name", :name => "site[name]"
      assert_select "input#site_slug", :name => "site[slug]"
      assert_select "input#site_title", :name => "site[title]"
      assert_select "textarea#site_tagline", :name => "site[tagline]"
      assert_select "input#site_owner", :name => "site[owner]"
    end
  end
end
