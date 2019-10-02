class SessionsController < ApplicationController
  def new
  end
  def create
    usr = Usr.find_by(email: params[:session][:email].downcase)
    if usr && usr.authenticate(params[:session][:password])
      session[:usr_id] = usr.id
      redirect_to tasks_path(usr.id)
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end
  def destroy
    session.delete(:usr_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
