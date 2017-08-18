class ChangeColumnStatusOpportunity < ActiveRecord::Migration
  def change
    change_column :opportunities, :status, :integer, default: 0
  end
end
