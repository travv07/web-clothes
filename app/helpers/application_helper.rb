module ApplicationHelper
  def full_title page_title
    base_title = "Shop clothes"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end
end
