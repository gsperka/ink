class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit(:username, :password, :password_confirmation, :email, :first_name, :last_name))
    if @user.save
      session[:current_user_id] = @user.id
      if session[:new_user_sketch_id]
        sketch = Sketch.find(session[:new_user_sketch_id]).update(user_id: current_user.id)
        session[:new_user_sketch_id] = nil
      end
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    if current_user != nil
      @sketches = Sketch.where(user_id: session[:current_user_id])
    elsif
      @sketches = Sketch.where(user_id: session[:current_google_user_id])
    end
  end

end
