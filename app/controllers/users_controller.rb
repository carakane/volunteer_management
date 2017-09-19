class UsersController < ApplicationController

  def show
    @user = current_user
    @opportunities = Opportunity.by_organization(@user.organizations).most_recent.open
    # respond_to do |f|
    #   f.html { render :show }
    #   f.json { render json: @opportunities }
    # end

     render json: @opportunities
  end

end
