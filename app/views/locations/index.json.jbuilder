json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address, :phone, :manager, :open_at, :close_at
  json.url location_url(location, format: :json)
end
