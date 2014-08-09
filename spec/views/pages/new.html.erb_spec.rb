require 'rails_helper'

RSpec.describe "pages/new", :type => :view do
  before(:each) do
    assign(:page, Page.new(
      :text_1 => "MyText",
      :text_2 => "MyText",
      :text_3 => "MyText",
      :locale => "MyString"
    ))
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do

      assert_select "textarea#page_text_1[name=?]", "page[text_1]"

      assert_select "textarea#page_text_2[name=?]", "page[text_2]"

      assert_select "textarea#page_text_3[name=?]", "page[text_3]"

      assert_select "input#page_locale[name=?]", "page[locale]"
    end
  end
end
