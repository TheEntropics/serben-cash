class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    @current_user ||= Credential.find(session[:user_id]) rescue nil
  end
end
