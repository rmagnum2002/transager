module PagesHelper
  def root_page_parts_count_class
    return 'col-sm-2 col-md-2' if @settings.root_page_parts_count == 6
    return 'col-sm-3 col-md-3' if @settings.root_page_parts_count == 4
    return 'col-sm-4 col-md-4' if @settings.root_page_parts_count == 3
    return 'col-sm-6 col-md-6' if @settings.root_page_parts_count == 2
    return 'col-sm-12 col-md-12' if @settings.root_page_parts_count == 1
  end
end
