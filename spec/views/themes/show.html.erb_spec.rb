require 'spec_helper'

describe "themes/show.html.erb" do
  before(:each) do
    theme = assign(:theme, stub_model(Theme,
      :site => nil,
      :name => "Name",
      :description => "MyText",
      :directory => "Directory"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Directory/)
  end
end
