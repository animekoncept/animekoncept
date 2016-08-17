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

  def flash_class(level)
    case level
      when "notice" then "callout primary"
      when "success" then "callout success"
      when "error" then "callout alert"
      when "alert" then "callout alert"
    end
  end


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

  def username
    if user_signed_in?
      current_user.username
    else
      "Guest"
    end
  end

  def greet
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    if midnight.upto(noon).include?(current_time)
      "Good Morning"
    elsif noon.upto(five_pm).include?(current_time)
      "Good Afternoon"
    elsif five_pm.upto(eight_pm).include?(current_time)
      "Good Evening"
    elsif eight_pm.upto(midnight + 1.day).include?(current_time)
      "Good Night"
    end
  end

end
