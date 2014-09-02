require 'rails_helper'

RSpec.describe "feedbacks/edit", :type => :view do
  before(:each) do
    @feedback = assign(:feedback, Feedback.create!(
      :department_id => 1,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit feedback form" do
    render

    assert_select "form[action=?][method=?]", feedback_path(@feedback), "post" do

      assert_select "input#feedback_department_id[name=?]", "feedback[department_id]"

      assert_select "input#feedback_name[name=?]", "feedback[name]"

      assert_select "input#feedback_email[name=?]", "feedback[email]"

      assert_select "input#feedback_phone[name=?]", "feedback[phone]"

      assert_select "textarea#feedback_message[name=?]", "feedback[message]"
    end
  end
end
