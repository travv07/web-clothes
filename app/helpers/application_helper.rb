module ApplicationHelper
  def full_title page_title
    base_title = "Shop clothes"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def flash_class level
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-danger"
      when "danger" then "alert alert-danger"
      when "alert" then "alert alert-warning"
      when "warning" then "alert alert-warning"
    end
  end
end
