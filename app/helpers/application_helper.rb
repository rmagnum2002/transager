module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "danger"
    when :alert then "danger"
    end
  end

  def keywords
    @page.present? ? (@page.keywords.empty? ? @settings.keywords : @page.keywords) : @settings.keywords
  end
end
