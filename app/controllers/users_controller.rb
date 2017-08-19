class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @opportunities = Opportunity.by_organization(@user.organizations).most_recent.open
  end

end
