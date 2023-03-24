class AddTimestampToTeams < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:teams, null: false)
  end
end
