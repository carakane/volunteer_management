class WelcomeController < ApplicationController

  def index
    if current_user.present?
      @user = current_user
      flash[:notice] = "Welcome, #{@user.email}"
    end
  end

  # def after_sign_in_path_for(resource)
  #   @user = current_user
  #   request.env['omniauth.origin'] || user_path(@user)
  # end

end
