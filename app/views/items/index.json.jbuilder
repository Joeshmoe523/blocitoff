json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :due_date, :description, :status
  json.url item_url(item, format: :json)
end
