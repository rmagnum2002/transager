class Contact < ActiveRecord::Base
  validates :contact_type, :department_id, :details, presence: true

  CONTACT_TYPE = {
    :"contact_type.phone" => 1,
    :"contact_type.phone_fax" => 2,
    :"contact_type.mobile" => 3,
    "email" => 4,
    "skype" => 5
  }

  DEPARTMENT_ID = {
    :"department_id.transport" => 1,
    :"department_id.shop" => 2,
    :"department_id.service" => 3,
    :"department_id.accountant" => 4
  }
end
