class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :opportunities
  has_many :volunteer_skills
  has_one :availability
end
