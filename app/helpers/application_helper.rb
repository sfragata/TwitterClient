module ApplicationHelper

  def string_2_date_formated(str_date)
  	#puts str_date.class
    return str_date.strftime('%Y/%m/%d %H:%M:%S ')
  end
  
end
