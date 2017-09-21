class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :volunteer_skills
end
