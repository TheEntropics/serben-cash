class LoginController < ApplicationController
  def login
  end

  def do_login
    username = params[:username]
    password = params[:password]

    user = Credential.find_by username: username
    if user.try(:authenticate, password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      session[:user_id] = nil
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
