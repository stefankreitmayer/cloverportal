class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  private

  def logged_in_group
    @logged_in_group ||= Group.find(session[:group_id]) if session[:group_id]
  end

  def authorize
    redirect_to root_path unless logged_in_group
  end
end
