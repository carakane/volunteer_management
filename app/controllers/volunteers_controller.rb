class VolunteersController < ApplicationController
  before_action :find_volunteer, only: [:show, :edit, :update, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)
    redirect_to volunteer_path(@volunteer)
  end

  def show
    @opportunities = @volunteer.opportunities
  end

  def edit
  end

  def update
    @volunteer.update(volunteer_params)
    flash[:notice] = "You have edited #{@volunteer.name}."
    redirect_to volunteer_path(@volunteer)
  end

  def destroy
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
