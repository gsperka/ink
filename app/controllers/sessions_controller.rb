class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      if session[:new_user_sketch_id]
        sketch = Sketch.find(session[:new_user_sketch_id]).update(user_id: current_user.id)
        session[:new_user_sketch_id] = nil
      end
      redirect_to root_path
    else
      redirect_to :back, flash: {error: "Invalid email/password combination"}
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
