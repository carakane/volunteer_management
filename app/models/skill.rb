class Skill < ActiveRecord::Base
  has_many :volunteer_skills, dependent: :destroy
  has_many :volunteers, through: :volunteer_skills
  validates :name, presence: true, uniqueness: :true
end
