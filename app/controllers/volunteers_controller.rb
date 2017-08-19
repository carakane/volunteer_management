class VolunteersController < ApplicationController

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
    @volunteer = Volunteer.find(params[:id])
    # binding.pry
  end

  private

    def volunteer_params
      params.require(:volunteer).permit(:name,
      availability_attributes: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday])
    end
end
