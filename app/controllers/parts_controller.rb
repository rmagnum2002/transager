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
    @parts = parts.page(params[:page]).per_page(current_settings.search_limit)
    @message = I18n.t('found_parts', size: parts.size, query: @query)
    if @parts.any?
      ids = @parts.pluck(:internal_id)
      p "IDS #{ids}"
      payload = {'cod' => ids}.to_json
      response = db_request(payload)
      data = (response.body.empty?) ? {parts: []} : {parts: response.body.gsub("\n", '')}
      gon.json = JSON.parse(data.to_json)
    end

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "price list",
               layout: 'application.pdf.erb'
      end
    end
  end

  def show
    @part = Part.find(params[:id])
    payload = {'cod' => ["#{@part.internal_id}"]}.to_json
    response =db_request(payload)
    json = JSON.parse(response.body).first
    if json
      @part_details = json
    else
      @part_details = {
        "price"=>0,
        "stock"=>{}
      }
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def tires
    @parts = Part.where(category_id: 1)

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "price list",
               :layout => 'application.pdf.erb'
      end
    end
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

  def parts_list
    @query = params[:query]
    @parts = Part.order(:name).quick_search(@query)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "price list",
              layout: 'application.pdf.erb',
              page_size: 'A4',
              header: { right: '[page] of [topage]'}
      end
    end
  end

  def db_request(payload)
    uri = URI.parse("#{ENV['DATA_HOST']}/trans/hs/getstock/")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.basic_auth(ENV['DATA_HOST_USERNAME'], ENV['DATA_HOST_PASSWORD'])
    request.content_type = 'application/json'
    request.body = payload
    response = http.request(request)
  end
end
