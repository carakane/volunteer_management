class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :volunteer_skills
  has_many :volunteers, through: :volunteer_skills
end
