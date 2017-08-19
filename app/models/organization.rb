# t.string   "name"
# t.integer  "user_id"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false

class Organization < ActiveRecord::Base
  belongs_to :user
  has_many :opportunities
  has_many :volunteers, through: :opportunities
  validates :name, presence: true

end
