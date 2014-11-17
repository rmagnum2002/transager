module ContactsHelper
  def footer_li(c)
    if c.contact_type == 1
      "<i class='fa fa-phone'></i>".html_safe
    elsif c.contact_type == 2
      "<i class='fa fa-fax'></i>".html_safe
    elsif c.contact_type == 3
      "<i class='fa fa-mobile'></i>".html_safe
    elsif c.contact_type == 4
      "<i class='glyphicon glyphicon-envelope'>".html_safe
    elsif c.contact_type == 5
      "<i class='fa fa-skype'></i>".html_safe
    end
  end
end
