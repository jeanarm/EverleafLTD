class UsrsController < ApplicationController
  before_action :set_usr, only: [:show, :edit, :update, :destroy]

  # GET /usrs
  # GET /usrs.json
  def index
    @usrs = Usr.all
  end

  # GET /usrs/1
  # GET /usrs/1.json
  def show
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
        format.html { redirect_to new_session_path, notice: 'Usr was successfully created.' }
        format.json { render :show, status: :created, location: @usr }
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
    @usr.destroy
    respond_to do |format|
      format.html { redirect_to usrs_url, notice: 'Usr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usr
      @usr = Usr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usr_params
      params.require(:usr).permit(:name, :email, :password, :confirm_password, :admin)
    end
end
