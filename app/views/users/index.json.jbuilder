json.array!(@users) do |user|
  json.extract! user, :id, :name, :GovID, :address, :AuthNum, :YiBoID
  json.url user_url(user, format: :json)
end
