json.array!(@application_settings) do |application_setting|
  json.extract! application_setting, 
  json.url application_setting_url(application_setting, format: :json)
end
