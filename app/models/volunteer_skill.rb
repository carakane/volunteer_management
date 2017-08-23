class VolunteerSkill < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :skill
end
