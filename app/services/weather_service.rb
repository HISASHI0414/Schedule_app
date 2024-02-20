require 'httparty'

class WeatherService
  include HTTParty
  base_uri 'api.openweathermap.org/data/2.5'

  def initialize(api_key)
    @api_key = api_key
  end

  def forecast(city)
    self.class.get("/forecast?q=#{city}&appid=#{@api_key}&units=metric")
  end
end
