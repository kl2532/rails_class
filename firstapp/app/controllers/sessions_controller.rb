class SessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create]

  def new

  end

  def create

    user = User.find_by(email: params[:session][:email])
    if user
      puts 'We fetched the user'
      session[:user_id] = user.id
      redirect_to users_path
    else
      render "signup"
    end  
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end