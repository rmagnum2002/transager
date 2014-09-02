require 'rails_helper'

RSpec.describe "feedbacks/show", :type => :view do
  before(:each) do
    @feedback = assign(:feedback, Feedback.create!(
      :department_id => 1,
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
