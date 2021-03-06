module ApplicationHelper
  
  def title(t)
    t2 = t
    t2 = " - #{t}" if content_for?(:title)
    content_for(:title, "#{t2}")
    t
  end
  
  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "success"
    end
  end
  
  def home?
    current_page?(root_path)
  end

  def current_url
    "http://#{request.host+request.fullpath}"
  end
  
end
