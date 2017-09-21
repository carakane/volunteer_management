class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :day, :status
  belongs_to :organization
  belongs_to :volunteer
end
