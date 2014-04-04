json.array!(@radiators) do |radiator|
  json.extract! radiator, :id
  json.url radiator_url(radiator, format: :json)
end
