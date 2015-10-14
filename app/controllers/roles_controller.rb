class RolesController < ApplicationController
  before_action :load_role, only: [:show, :update, :edit, :destroy]

  def index
    @roles = Role.all
    respond_to do |f|
      f.html
      f.json { render json: @roles }
    end
  end
  def show
    respond_to do |f|
      f.html
      f.json { render json: @role }
    end
  end

  def update
    if @role.update(role_params)
      redirect_to @role
    else
      render :edit
    end
  end
  def edit
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to @role
    else
      render :new
    end
  end
  def new
    @role = Role.new
  end

  def destroy
    if @role.destroy
      redirect_to root_path
    else
      redirect_to @role
    end
  end

  private

  def load_role
    @role = Role.find params[:id]
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
