class GoogleController < ApplicationController
  def new
    @googleuser = Googleuser.new
  end

  def create
    @googleuser = Googleuser.from_omniauth(env["omniauth.auth"])
    if User.find_by(id: @googleuser.user_id)
      user = User.find_by(id: @googleuser.user_id)
    else
      user = User.new()
      user.username = @googleuser.name
      user.save(:validate => false)
    end
    @googleuser.update(user_id: user.id)
    session[:current_user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:current_google_user_id] = nil
    redirect_to root_path
  end
end
