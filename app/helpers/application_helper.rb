module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
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
end
