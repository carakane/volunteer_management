class VolunteerSkillSerializer < ActiveModel::Serializer
  attributes :id, :volunteer_id, :skill_id
  belongs_to :volunteer
  belongs_to :skill
end
