module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "danger"
    when :alert then "danger"
    end
  end

  def number_to_phone(number)
    "+373 #{number.scan(/.{1,3}/).join(' ')}"
  end

  def keywords
    @page.present? ? (@page.keywords.empty? ? @settings.keywords : @page.keywords) : @settings.keywords
  end

  def collapse_slider
    css_class = ''

    if @settings.collapsing_header
      (controller_name == 'welcome' && action_name == 'index') ? (css_class = '') : (css_class = 'collapsing_header')
    else
      css_class = 'collapsing_header' if (controller_name == 'welcome' && action_name != 'index')
    end
    return css_class
  end
end
