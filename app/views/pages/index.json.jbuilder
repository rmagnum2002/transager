json.array!(@pages) do |page|
  json.extract! page, :id, :text_1, :text_2, :text_3, :locale
  json.url page_url(page, format: :json)
end
