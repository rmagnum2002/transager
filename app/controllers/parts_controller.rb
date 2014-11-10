class PartsController < ApplicationController
  def index
    if params[:category_id]
      @query = params[:category_id]
      parts = Part.order(:name).where(category_id: params[:category_id])
    else
      @query = params[:query]
      @exact_part = Part.where(name: @query).first || Part.where(manufacturer_id: @query).first
      parts = Part.order(:name).quick_search(@query)
    end
    @parts = parts.page(params[:page]).per_page(30)
    @message = I18n.t('found_parts', size: parts.size, query: @query)
  end

  def autocomplete
    parts = Part.quick_search(params[:term]).limit(10).map{|p| "#{p.manufacturer_id} / #{p.seller_id} - #{p.name}"}
    # tires = parts.tires.map{|p| Hash[label: p.name, category: t("parts.tires")]}
    # batteries = parts.batteries.map{|p| Hash[label: p.name, category: t('parts.batteries')]}
    # truck_filters = parts.truck_filters.map{|p| Hash[label: p.name, category: t("parts.truck_filters")]}
    # car_filters = parts.car_filters.map{|p| Hash[label: p.name, category: t("parts.car_filters")]}
    # repair_kits = parts.repair_kits.map{|p| Hash[label: p.name, category: t("parts.repair_kits")]}
    # brake_discs = parts.brake_discs.map{|p| Hash[label: p.name, category: t("parts.brake_discs")]}
    # tie_rod = parts.tie_rod.map{|p| Hash[label: p.name, category: t("parts.tie_rod")]}
    # oil_seals = parts.oil_seals.map{|p| Hash[label: p.name, category: t("parts.oil_seals")]}
    # compressors = parts.compressors.map{|p| Hash[label: p.name, category: t('parts.compressors')]}
    # filter_drier = parts.filter_drier.map{|p| Hash[label: p.name, category: t('parts.filter_drier')]}
    # brake_drums = parts.brake_drums.map{|p| Hash[label: p.name, category: t('parts.brake_drums')]}
    # hubs = parts.hubs.map{|p| Hash[label: p.name, category: t('parts.hubs')]}
    # brake_pads = parts.brake_pads.map{|p| Hash[label: p.name, category: t('parts.brake_pads')]}
    # other = parts.other.map{|p| Hash[label: p.name, category: t('parts.other')]}

    # json = tires + batteries + truck_filters + car_filters + repair_kits + brake_discs + tie_rod + oil_seals + compressors + filter_drier + brake_drums + hubs + brake_pads + other

    render json: parts
  end
end
