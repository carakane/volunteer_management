class VolunteersController < ApplicationController
  before_action :find_volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
    @availability = @volunteer.build_availability
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)

    if @volunteer.save
      flash[:notice] = "You have created #{@volunteer.name}."
      redirect_to volunteer_path(@volunteer)
    else render :new
    end
  end

  def show
    @opportunities = @volunteer.opportunities
  end

  def edit
    @availability = @volunteer.availability
  end

  def update
     if @volunteer.update(volunteer_params)
       flash[:notice] = "You have edited #{@volunteer.name}."
       redirect_to volunteer_path(@volunteer)
     else
       render :edit
     end
  end

  def destroy
    if @volunteer.opportunities.present?
      Opportunity.find_by(volunteer_id: @volunteer.id).update(status: 0, volunteer_id: nil)
    end
    @volunteer.destroy
    flash[:notice] = "You have deleted #{@volunteer.name}."
    redirect_to volunteers_path
  end

  private

    def find_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    def volunteer_params
      params.require(:volunteer).permit(:name,
      availability_attributes: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
    end
end
