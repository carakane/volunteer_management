class Volunteer < ActiveRecord::Base
  has_many :opportunities
  has_many :organizations, through: :opportunities
end
