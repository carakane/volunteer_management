class WelcomeController < ApplicationController

  def index
    if current_user.present?
      @user = current_user
      flash[:notice] = "Welcome, #{@user.email}"
    end
  end

end
