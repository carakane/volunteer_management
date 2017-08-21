# t.integer "volunteer_id"
# t.string  "monday",       default: "f", null: false
# t.string  "tuesday",      default: "f", null: false
# t.string  "wednesday",    default: "f", null: false
# t.string  "thursday",     default: "f", null: false
# t.string  "friday",       default: "f", null: false
# t.string  "saturday",     default: "f", null: false
# t.string  "sunday",       default: "f", null: false

class Availability < ActiveRecord::Base
  belongs_to :volunteer

  def boolean_converter(input)
    # binding.pry
    input ? 'Yes' : "No"
  end
end
