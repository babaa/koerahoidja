class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :logout]
  before_filter :save_login_state, :only => [:index, :login, :login_attempt]

  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:email],params[:login_password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.email}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Email or Password"
      flash[:color]= "invalid"
      render "login"  
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :action => 'login'
  end

  def home
  end

  def profile
  end

  def setting
  end
end
