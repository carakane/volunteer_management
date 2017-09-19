class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :status, :day
  belongs_to :organization
  belongs_to :volunteer
end
