class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :city
      t.string :team_name
      t.boolean :stanley_cup_champ
      t.integer :points
      t.string :division

      t.timestamps
    end
  end
end
