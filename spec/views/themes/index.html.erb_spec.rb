require 'spec_helper'

describe "themes/index.html.erb" do
  before(:each) do
    assign(:themes, [
      stub_model(Theme,
        :site => nil,
        :name => "Name",
        :description => "MyText",
        :directory => "Directory"
      ),
      stub_model(Theme,
        :site => nil,
        :name => "Name",
        :description => "MyText",
        :directory => "Directory"
      )
    ])
  end

  it "renders a list of themes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Directory".to_s, :count => 2
  end
end
