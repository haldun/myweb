require 'spec_helper'

describe "pages/new.html.erb" do
  before(:each) do
    assign(:page, stub_model(Page,
      :site => nil,
      :title => "MyString",
      :slug => "MyString",
      :author => nil,
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path, :method => "post" do
      assert_select "input#page_site", :name => "page[site]"
      assert_select "input#page_title", :name => "page[title]"
      assert_select "input#page_slug", :name => "page[slug]"
      assert_select "input#page_author", :name => "page[author]"
      assert_select "textarea#page_content", :name => "page[content]"
    end
  end
end
