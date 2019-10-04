class SessionsController < ApplicationController
  def new
  end
  def create
    usr = Usr.find_by(email: params[:session][:email].downcase)
    if usr && usr.authenticate(params[:session][:password])
      session[:usr_id] = usr.id
      if usr.admin?
        redirect_to admin_usrs_path

        flash[:notice] = 'Welcome administrator'
      
      else
        flash[:notice] = 'welcome !! You are redirected to Tasks list because you are not admin!!'
      
      redirect_to tasks_path(usr.id)
      end
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end
  def destroy
    session.delete(:usr_id)
    redirect_to new_session_path
  end
end
