# t.string   "name"
# t.integer  "organization_id"
# t.integer  "volunteer_id"
# t.integer  "status",          default: 0
# t.datetime "created_at",                  null: false
# t.datetime "updated_at",                  null: false
# t.integer  "day",             default: 0

class Opportunity < ActiveRecord::Base
  belongs_to :organization
  belongs_to :volunteer
  validates :name, presence: true
  validates :organization_id, presence: true
  enum status: [:open, :assigned, :completed]
  enum day: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
  #enum status: {open: 0, assigned: 1, completed: 2}
  scope :most_recent, -> (limit) { order("created_at desc").limit(limit)}

  def opportunity_match?
    @volunteers = []
    a = Availability.where("#{self.day}": "true")
    a.each do |av|
      @volunteers << av.volunteer unless av.volunteer.opportunities.pluck(:status) == [1]
    end
    @volunteers
end
end

#http://api.rubyonrails.org/v4.1.0/classes/ActiveRecord/Enum.html
