class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :status, :day, :name
  belongs_to :organization
  belongs_to :volunteer
end
