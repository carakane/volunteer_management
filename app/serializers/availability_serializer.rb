class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id, :volunteer_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  belongs_to :volunteer
end
