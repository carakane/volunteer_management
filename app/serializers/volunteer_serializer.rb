class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :opportunities
  has_one :availability
end
