class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.present?
      if current_user.has_organizations?
        @organizations = current_user.organizations
      else
        flash[:notice] = "You have no organizations."
        redirect_to new_organization_path
      end
    else
      @organizations = Organization.all
    end
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.new(organization_params)

    if @organization.save
      flash[:notice] = "You have created #{@organization.name}."
      redirect_to organization_path(@organization)
    else render :new
    end
  end

  def show
    @user = current_user
    @opportunities = @organization.opportunities if @organization.opportunities
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      flash[:notice] = "You have edited #{@organization.name}."
      redirect_to organization_path(@organization)
    else
      render :edit
    end
  end

  def destroy
    flash[:notice] = "You have deleted #{@organization.name}."
    @organization.destroy
    redirect_to organizations_path
  end

  private

    def find_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name)
    end
end
