class PartsController < ApplicationController
  def index
    @query = params[:query]
    @exact_part = Part.where(name: @query).first || Part.where(manufacturer_id: @query).first
    parts = Part.quick_search(@query)
    @parts = parts.page(params[:page]).per_page(25)
    @message = I18n.t('found_parts', size: parts.size, query: @query)
  end

  def autocomplete
    parts = Part.quick_search(params[:term]).limit(5)
    tires = parts.tires.map{|p| Hash[label: p.name, category: 'tires']}
    batteries = parts.batteries.map{|p| Hash[label: p.name, category: 'batteries']}
    truck_filters = parts.truck_filters.map{|p| Hash[label: p.name, category: 'truck filters']}
    car_filters = parts.car_filters.map{|p| Hash[label: p.name, category: 'car filters']}
    render json: tires + batteries + truck_filters + car_filters
  end
end
