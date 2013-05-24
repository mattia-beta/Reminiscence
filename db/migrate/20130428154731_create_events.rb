class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image
      t.date :date
      t.string :type

      t.timestamps
    end
  end
end
