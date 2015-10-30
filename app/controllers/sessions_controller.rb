class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to news_index_path
    else
      flash[:notice] = "Invalid login."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
