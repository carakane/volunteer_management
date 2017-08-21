# t.integer "volunteer_id"
# t.boolean  "monday",       default: false, null: false
# t.boolean  "tuesday",      default: false, null: false
# t.boolean  "wednesday",    default: false, null: false
# t.boolean  "thursday",     default: false, null: false
# t.boolean  "friday",       default: false, null: false
# t.boolean  "saturday",     default: false, null: false
# t.boolean  "sunday",       default: false, null: false

class Availability < ActiveRecord::Base
  belongs_to :volunteer

end
