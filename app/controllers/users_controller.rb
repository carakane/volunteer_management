class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @opportunities = Opportunity.most_recent(10).open
  end

end
