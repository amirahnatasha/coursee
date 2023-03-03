class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end
  
  def login
  end
  
  def create
  end
  
  def destroy
    log_out if logged_in?
    redirect_to '/login'
  end
  
  def create
    @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/courses/home'
   else
     respond_to do |format|
      format.html { redirect_to '/login', notice: "ユーザー名もしくはパスワードが違います。入力し直してください。" }
      format.json { head :no_content }
    end
   end
  end
  
  def page_requires_login
  end
  
end
