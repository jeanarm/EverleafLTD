class Admin::UsrsController < ApplicationController
  before_action :require_admin
  before_action :set_usr, only: [:show, :edit, :update]
  # before_action :only_see_own_page, only: [:show]
  # before_action :only_create_user_when_none_signed_in,  only:[:new, :create]
  
  def require_admin
    unless current_user.try(:admin?)
      redirect_to root_path, notice: "are you admin?please login"
    end
  end 



  def index
    @usrs = Usr.all
    @tasks=Task.all
  end
 
  def show
    @user_tasks=Task.order(:created_at).includes(:usr)
  end

  # GET /usrs/new
  def new
    @usr = Usr.new
  end

  # GET /usrs/1/edit
  def edit
  end

  # POST /usrs
  # POST /usrs.json
  def create
    @usr = Usr.new(usr_params)

    respond_to do |format|
      if @usr.save
        session[:usr_id] = @usr.id
        if @usr.admin?
        format.html { redirect_to admin_usrs_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @usr }
         else 
          format.html { redirect_to tasks_url, notice: 'Usr was successfully created.' }
    
           format.json { render :show, status: :created, location: @usr }
        end
      else
        format.html { render :new }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usrs/1
  # PATCH/PUT /usrs/1.json
  def update
    respond_to do |format|
      if @usr.update(usr_params)
        format.html { redirect_to @usr, notice: 'Usr was successfully updated.' }
        format.json { render :show, status: :ok, location: @usr }
      else
        format.html { render :edit }
        format.json { render json: @usr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usrs/1
  # DELETE /usrs/1.json
  def destroy
    @usr = Usr.find(params[:id])
    if @usr.id == current_user.id
      redirect_to admin_usrs_url, notice: "You can not delete signed in user"
      @admins = Usr.admins
    elsif @admins == 1
      redirect_to admin_usrs_url, notice: "At least one admin must remain!"
    else
      @usr.destroy
      redirect_to admin_usrs_url, notice: 'User was successfully destroyed.'
    end
  end



  private
  def only_see_own_page
    @user = Usr.find(params[:id])
    if current_user != @user
      redirect_to usrs_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
 
 def only_create_user_when_none_signed_in
    if current_user
      redirect_to usrs_path,  notice: "you can't create user when signed in"
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_usr
      @usr = Usr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usr_params
      params.require(:usr).permit(:name, :email, :password, :confirm_password, :admin)
    end
end
