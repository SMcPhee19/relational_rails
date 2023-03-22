class RemoveDivisionFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :created_at, :datetime
  end
end
