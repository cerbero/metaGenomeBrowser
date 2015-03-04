json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :dataset_name, :description, :user_id
  json.url dataset_url(dataset, format: :json)
end
