class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  layout "user", except: 'new'

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    redirect_to root_path and return if @current_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user.county ||= County.find_by(name: 'Harjumaa')
    @location_params = {
      parishes_and_towns: @user.county.parishes_and_towns_for_grouped_select
    }
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = t('signup-successful')
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      flash[:notice] = t('form-invalid')
      render action: "new"
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('user-update-successful')
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: t('user-destroyed')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :profile_photo, :availability, :about, :suitable_dogs, :home_description, :family, :experience, :county_id, :parish_town)
    end
end
