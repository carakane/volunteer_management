class Availability < ActiveRecord::Base
  belongs_to :volunteer
  validates :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, presence: true
end
