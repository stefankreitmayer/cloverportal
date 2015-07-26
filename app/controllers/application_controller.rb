class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  private

  def authorize
    redirect_to root_path unless session[:role]
  end

  def begin_session role_name, id
    session[:role] = role_name
    session[:id] = id
  end

  def terminate_session
    session[:role] = session[:id] = nil
    redirect_to root_path
  end
end
