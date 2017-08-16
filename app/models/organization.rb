class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :opportunities
  has_many :volunteers, through: :opportunities
end