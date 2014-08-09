require 'rails_helper'

RSpec.describe "pages/index", :type => :view do
  before(:each) do
    assign(:pages, [
      Page.create!(
        :text_1 => "MyText",
        :text_2 => "MyText",
        :text_3 => "MyText",
        :locale => "Locale"
      ),
      Page.create!(
        :text_1 => "MyText",
        :text_2 => "MyText",
        :text_3 => "MyText",
        :locale => "Locale"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
  end
end
