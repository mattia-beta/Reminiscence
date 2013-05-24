class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :year

      t.timestamps
    end
  end
end
