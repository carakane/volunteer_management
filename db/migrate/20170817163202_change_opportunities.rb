class ChangeOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :day, :string
  end
end
