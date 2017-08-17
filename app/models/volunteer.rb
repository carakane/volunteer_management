class Volunteer < ActiveRecord::Base
  has_many :opportunities
  has_many :organizations, through: :opportunities
  has_one :availability
  validates :name, presence: true
  # accepts_nested_attributes_for :availability

  def availability_attributes=(availability_attributes)
    if self.availability.present?
      availability = Availability.find_by(volunteer_id: self.id)
      availability.update(availability_attributes)
    else
      availability = Availability.create(availability_attributes)
      self.availability = availability
    end
  end
end
