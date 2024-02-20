module ApplicationHelper
  def parse_date_select_params(params, field_name)
    year = params["#{field_name}(1i)"].to_i
    month = params["#{field_name}(2i)"].to_i
    day = params["#{field_name}(3i)"].to_i

    Date.new(year, month, day)
  rescue ArgumentError
    nil # 無効な日付の場合はnilを返す
  end
end
