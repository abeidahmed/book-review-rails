module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authenticate
    redirect_to root_url unless current_user.nil?
  end

  def is_admin?
    redirect_to root_url if current_user.nil? || !current_user.admin?
  end

  def only_admin
    current_user && current_user.admin?
  end

  def render_header
    hide_controller = ["users", "sessions"]
    hide_action = ["new"]
    unless hide_controller.include?(controller.controller_name) && hide_action.include?(controller.action_name)
      render "layouts/header"
    end
  end

  def is_admin_page?
    # params[:controller].index("admin/") == 0
    controller.class.parents.include?(Admin)
  end

  def display_date(current_day)
    current_day.strftime("#{current_day.day.ordinalize} %b, %Y")
  end

  def title(page_title = "")
    base_title = "Book review app"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
