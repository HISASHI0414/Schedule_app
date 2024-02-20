module ForecastsHelper
  def weather_icon_for(main)
    case main
    when "Clear"
      "☀️"
    when "Clouds"
      "☁️"
    else
      "☔️"
    end
  end
end
