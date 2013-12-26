class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]
  
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:login_password])
    if authorized_user
      flash[:notice] = "Tere jälle! Logisid sisse e-mailiga #{authorized_user.email}"
      session[:user_id] = authorized_user.id
      redirect_to user_path(authorized_user)
    else
      flash[:alert] = "Invalid Email or Password"
      render "login"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
