class OrganizationsController < ApplicationController
  before_action :find_organization, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:show, :edit,]
  before_action :user_present?

  def index
    if current_user.present?
      if current_user.has_organizations?
        @organizations = current_user.organizations
        respond_to do |f|
          f.html { render :index }
          f.json { render json: @organizations }
        end
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
    render json: @organization
    if @organization.user == @user
      @opportunities = @organization.opportunities
    else redirect_to '/'
    end
  end

  def edit
    if @organization.user != @user
      redirect_to '/'
    end
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

    def find_user
      @user = current_user
    end

    def organization_params
      params.require(:organization).permit(:name)
    end
end
