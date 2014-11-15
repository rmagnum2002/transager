class AppMailer < ActionMailer::Base
  default from: "no-reply@transager.md"

  def feedback(feedback)
    @feedback = feedback
    email = Contact.where(contact_type: 4, department_id: feedback.department_id).first.details

    mail to: email
  end
end
