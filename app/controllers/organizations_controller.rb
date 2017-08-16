class OrganizationsController < ApplicationController

  def index
    binding.pry
    # current_user.organizations
    @organizations = Organization.find_by(user_id: current_user.id)

  end
end
