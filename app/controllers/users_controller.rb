class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:username, :password, :password_confirmation, :email, :first_name, :last_name))
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @sketches = Sketch.where(user_id: session[:current_user_id]) || Sketch.where(user_id: session[:current_google_user_id])
  end

end
