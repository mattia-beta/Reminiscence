class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :titolo
      t.string :testo
      t.datetime :data
      t.boolean :privato
      t.string :luogo
      t.integer :senior_id

      t.timestamps
    end
  end
end
