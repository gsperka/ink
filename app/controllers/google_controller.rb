class GoogleController < ApplicationController
  def new
    @googleuser = Googleuser.new
  end

  def create
    @googleuser = Googleuser.from_omniauth(env["omniauth.auth"])
    session[:current_google_user_id] = @googleuser.id
    redirect_to root_path
  end

  def destroy
    session[:current_google_user_id] = nil
    redirect_to root_path
  end
end
