class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @opportunities = Opportunity.most_recent.open
  end

end
