json.array!(@items) do |item|
  json.extract! item, :id, :Name, :Description, :Price
  json.url item_url(item, format: :json)
end
