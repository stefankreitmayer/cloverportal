class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  private

  def authorize
    redirect_to root_path unless session[:lead] || session[:part]
  end

  def terminate_session
    session[:lead] = session[:part] = nil
    redirect_to root_path
  end
end
