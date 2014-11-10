module PartsHelper
  # CATEGORY = {
  #   0 => :"parts.other",
  #   1 => :"parts.tires",
  #   2 => :"parts.batteries",
  #   3 => :"parts.truck_filters",
  #   4 => :"parts.car_filters",
  #   5 => :"parts.repair_kits",
  #   6 => :"parts.brake_discs",
  #   7 => :"parts.tie_rod",
  #   8 => :'parts.oil_seals',
  #   9 => :"parts.compressors",
  #   10 => :"parts.filter_drier",
  #   11 => :'parts.brake_drums',
  #   12 => :"parts.hubs",
  #   13 => :"parts.brake_pads",
  #   14 => :"parts.bushings",
  #   15 => :"parts.level_valve",
  #   16 => :"parts.lights",
  #   17 => :"parts.reflectors",
  #   18 => :"parts.pneumatics",
  #   19 => :"parts.electric_parts"
  #   20 => :"parts.cardan_joint",
  #   21 => :"parts.radiator",
  #   22 => :"parts.cab",
  #   23 => :"parts.cab_pump"
  # }

  def category_image(p)
    # image_tag "#{Part::CATEGORY[p.category_id].to_s.split('.')[1]}.jpg", height: '100'
    return (image_tag 'tire.png', height: '100') if p.category_id == 1
    return (image_tag 'batteries.jpg', height: '100') if p.category_id == 2
    return (image_tag 'filters.jpg', height: '100') if p.category_id == 3
    return (image_tag 'filters.jpg', height: '100') if p.category_id == 4
    # return (image_tag 'repair_kits.jpg', height: '100') if p.category_id == 5
    return (image_tag 'brake_discs.jpg', height: '100') if p.category_id == 6
    return (image_tag 'tie_rod.jpg', height: '100') if p.category_id == 7
    return (image_tag 'oil_seals.jpg', height: '100') if p.category_id == 8
    # return (image_tag 'compressors.jpg', height: '100') if p.category_id == 9
    return (image_tag 'filter_drier.jpg', height: '100') if p.category_id == 10
    return (image_tag 'brake_drums.jpg', height: '100') if p.category_id == 11
    return (image_tag 'hubs.jpg', height: '100') if p.category_id == 12
    return (image_tag 'brake_pads.jpg', height: '100') if p.category_id == 13
    return (image_tag 'bushings.jpg', height: '100') if p.category_id == 14
    return (image_tag 'level_valve.jpg', height: '100') if p.category_id == 15
    return (image_tag 'lights.jpg', height: '100') if p.category_id == 16
    return (image_tag 'reflectors.jpg', height: '100') if p.category_id == 17
    return (image_tag 'pneumatics.jpg', height: '100') if p.category_id == 18
    return (image_tag 'electric_parts.jpg', height: '100') if p.category_id == 19
    return (image_tag 'cardan_joint.jpg', height: '100') if p.category_id == 20
    return (image_tag 'radiator.jpg', height: '100') if p.category_id == 21
    if p.category_id == 22 && p.truck_id > 0
      name = Part::TRUCK[p.truck_id].downcase
      return image_tag "#{name}_cab.jpg", height: '100'
    end
    return (image_tag 'cab_pump.jpg', height: '100') if p.category_id == 23
  end
end
