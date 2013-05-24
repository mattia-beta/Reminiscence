class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :type

      t.timestamps
    end
  end
end
