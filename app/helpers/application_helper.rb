module ApplicationHelper

  def string_2_date_formated(str_date)
    return Time.parse(str_date).strftime('%d/%m/%Y %H:%M:%S ')
  end
  
end
