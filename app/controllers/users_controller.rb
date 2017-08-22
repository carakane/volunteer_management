class UsersController < ApplicationController

  def show
    @user = current_user
    @opportunities = Opportunity.by_organization(@user.organizations).most_recent.open
  end

end
