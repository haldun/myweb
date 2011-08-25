require 'spec_helper'

describe "sites/show.html.erb" do
  before(:each) do
    site = assign(:site, stub_model(Site,
      :name => "Name",
      :slug => "Slug",
      :title => "Title",
      :tagline => "MyText",
      :owner => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
