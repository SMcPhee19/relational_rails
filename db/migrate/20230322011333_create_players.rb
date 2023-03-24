class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :birthplace
      t.boolean :league_award_winner
      t.integer :jersey_number
      t.string :position
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
