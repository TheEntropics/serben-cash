class UsersController < ApplicationController
  before_action :load_user, only: [:show, :update, :edit, :destroy, :new_role, :destroy_role]

  def index
    @users = User.all
    respond_to do |f|
      f.html
      f.json { render json: @users }
    end
  end
  def show
    @roles = @user.roles

    respond_to do |f|
      f.html
      f.json { render json: @user }
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
  def new
    @user = User.new
  end
  def new_role
    UsersRole.create user: @user, role_id: params[:user][:role_id]
    redirect_to @user
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      redirect_to @user
    end
  end
  def destroy_role
    UsersRole.destroy_all(user_id: @user, role_id: params[:role_id])
    redirect_to @user
  end

  private

  def load_user
    @user = User.find(params[:user_id] || params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
