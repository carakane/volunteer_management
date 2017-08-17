class Availability < ActiveRecord::Base
  belongs_to :volunteer_id
  validates :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, presence: true
end
