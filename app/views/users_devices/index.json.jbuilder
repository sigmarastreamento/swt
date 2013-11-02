json.array!(@users_devices) do |users_device|
  json.extract! users_device, 
  json.url users_device_url(users_device, format: :json)
end
