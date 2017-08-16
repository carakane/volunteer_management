class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      if current_user.has_organizations?
        @organizations = current_user.organizations
      else
        flash[:notice] = "You have no organizations."
        redirect_to new_user_organization_path
      end
    else
      @organizations = Organization.all
    end
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.create(organization_params)
    redirect_to organization_path(@organization)
  end

  def show
  end

  def edit
  end

  def update
    @organization.update(organization_params)
    redirect_to user_organization_path(current_user, @organization)
  end

  def destroy
    @organization.destroy
    redirect_to user_organizations_path(current_user)
  end

  private

    def find_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name)
    end
end
