require 'rosette_api'

api_key, url = ARGV

if !url
    rosette_api = RosetteAPI.new(api_key)
else
    rosette_api = RosetteAPI.new(api_key, url)
end

morphology_han_readings_data = "北京大学生物系主任办公室内部会议"
begin
    params = DocumentParameters.new(content: morphology_han_readings_data)
    response = rosette_api.get_han_readings(params)
    puts JSON.pretty_generate(response)
rescue RosetteAPIError => rosette_api_error
    printf("Rosette API Error (%s): %s", rosette_api_error.status_code, rosette_api_error.message)
end
