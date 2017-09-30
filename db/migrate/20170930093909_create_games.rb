class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :id_s
      t.boolean :first_turn
      t.boolean :training
      t.json :jumps
      t.json :board

      t.timestamps
    end
  end
end
