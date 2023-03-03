class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :authorized, only: [:new, :create, :show, :edit, :update, :destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
     @user = User.create(params.require(:user).permit(:username, :password))
     session[:user_id] = @user.id
     if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to '/login'
     else
      respond_to do |format|
      format.html { redirect_to '/login', notice: "新規登録しました！" }
      format.json { head :no_content }
    end
     end
  end
  
  def current_user    
    User.find_by(id: session[:user_id])  
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:userID, :username, :password)
    end
    
    def signup
    end
    
    def login
    end
end
