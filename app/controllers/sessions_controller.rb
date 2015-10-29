class SessionsController < ApplicationController
  def new
    # redirect_to user_links_path(user_id: current_user.id) if current_user
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect_to user_links_path(user_id: user.id)
    else
      flash[:notice] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
