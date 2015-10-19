class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def current_user
    if @current_user.nil?
      @current_user = Credential.find(session[:user_id]) rescue false
    end
    @current_user
  end
end
