class Availability < ActiveRecord::Base
  belongs_to :volunteer
  validates :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, presence: true

  def boolean_converter(input)
    # binding.pry
    input ? 'Yes' : "No"
  end
end
