class GoogleController < ApplicationController
  def new
    @googleuser = Googleuser.new
  end

  def create
    @google_user = Googleuser.from_omniauth(env["omniauth.auth"])
    user = @google_user.user || User.create_by_google_user(@google_user)

    session[:current_user_id] = user.id
    redirect_to root_path
  end

  def destroy
    # not used anymore, right?
    session[:current_google_user_id] = nil
    redirect_to root_path
  end
end
