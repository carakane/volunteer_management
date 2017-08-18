class OpportunitiesController < ApplicationController
  before_action :find_opportunity, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.has_opportunities?
      @opportunities = current_user.opportunities
    else
      flash[:notice] = "You have no opportunities."
      redirect_to new_opportunity_path
    end
  end

  def new
    @opportunity = Opportunity.new
    @user = current_user
    if params[:organization_id].present?
      @organization = Organization.find(params[:organization_id])
    end
  end

  def create
    @organization = Organization.find(params[:opportunity][:organization_id])
    @opportunity = @organization.opportunities.create(opportunity_params)
    redirect_to organization_opportunity_path(@organization, @opportunity)
  end

  def show
    @opportunity = Opportunity.find(params[:id])
    @organization = Organization.find(@opportunity.organization_id)
    @opportunities = @organization.opportunities if @organization.opportunities.present?
    @volunteers = @opportunity.opportunity_match?
  end

  def edit
    @user = current_user
    if params[:organization_id].present?
      @organization = Organization.find(params[:organization_id])
    end
    @volunteers = @opportunity.opportunity_match?
  end

  def update
    @opportunity.update(opportunity_params)
    @organization = Organization.find(@opportunity.organization_id)
    # @organization = Organization.find(params[:opportunity][:organization_id])
    if @opportunity.volunteer.present? && @opportunity.status == "open"
      @opportunity.status = "assigned"
    end
    redirect_to organization_opportunity_path(@organization, @opportunity)
  end

  def destroy
    @opportunity.destroy
    redirect_to opportunities_path
  end

  private

    def find_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    def opportunity_params
      params.require(:opportunity).permit(:name, :organization_id, :volunteer_id, :status)
    end
end
