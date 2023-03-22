class RemoveColumnFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :updated_at, :datetime
  end
end
