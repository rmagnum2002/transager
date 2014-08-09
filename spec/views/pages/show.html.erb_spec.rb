require 'rails_helper'

RSpec.describe "pages/show", :type => :view do
  before(:each) do
    @page = assign(:page, Page.create!(
      :text_1 => "MyText",
      :text_2 => "MyText",
      :text_3 => "MyText",
      :locale => "Locale"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Locale/)
  end
end
