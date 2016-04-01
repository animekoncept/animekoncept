module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                         :hard_wrap => true,
                                         :space_after_headers => true,
                                         :filter_html => true,
                                         :autolink => true,
                                         :no_intraemphasis => true,
                                         :fenced_code => true,
                                         :gh_blockcode => true,
                                         :highlight => true,
                                         :quote => true,
                                         :footnotes => true,
                                       )
    return markdown.render(text).html_safe
  end

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
