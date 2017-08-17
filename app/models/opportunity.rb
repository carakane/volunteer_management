class Opportunity < ActiveRecord::Base
  belongs_to :organization
  belongs_to :volunteer
  validates :name, presence: true
  validates :organization_id, presence: true

  def self.open_opportunities
    Opportunity.where(status: "open")
  end
end
