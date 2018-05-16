json.extract! item, :id, :type, :description, :title, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
