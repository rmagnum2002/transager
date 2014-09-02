require 'rails_helper'

RSpec.describe "feedbacks/index", :type => :view do
  before(:each) do
    assign(:feedbacks, [
      Feedback.create!(
        :department_id => 1,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :message => "MyText"
      ),
      Feedback.create!(
        :department_id => 1,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :message => "MyText"
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
