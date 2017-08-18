class ChangeDayColumnOpportunities < ActiveRecord::Migration
  def change
    change_column :opportunities, :day, :integer, default: 0
  end
end
