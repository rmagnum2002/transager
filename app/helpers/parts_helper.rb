module PartsHelper
  # categories: 1 - tires, 2 - batteries, 3 - truck filter, 4 - car filter

  def category_image(p)
    return (image_tag 'tire.png', height: '100') if p.category_id == 1
    return (image_tag 'filters.jpg', height: '100') if p.category_id == 3
    return (image_tag 'filters.jpg', height: '100') if p.category_id == 4
    return (image_tag 'batteries.jpg', height: '100') if p.category_id == 2
  end
end
