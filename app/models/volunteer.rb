class Volunteer < ActiveRecord::Base
  has_many :opportunities
  has_many :organizations, through: :opportunities
  has_one :availability, dependent: :destroy
  has_many :volunteer_skills, dependent: :destroy
  has_many :skills, through: :volunteer_skills
  validates :name, presence: true
  validates :availability, presence: true

  def availability_attributes=(availability_attributes)
    if self.availability.present?
      availability = Availability.find_by(volunteer_id: self.id)
      availability.update(availability_attributes)
    else
      availability = Availability.create(availability_attributes)
      self.availability = availability
    end
  end

  def skills_attributes=(skills_attributes)
      skills_attributes.each do |i, skill_attributes|
        if !skill_attributes.blank?
          skill = Skill.find_or_create_by(skill_attributes)
          self.volunteer_skills.build(:skill => skill)
        end
      end
    end
end
