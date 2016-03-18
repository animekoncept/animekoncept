module ApplicationHelper

  #helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_class(link_path)
    current_page?(link_path) ? "active_class" : ""
  end

  def active_link(link_path)
    current_page?(link_path) ? "active_link" : ""
  end

end
