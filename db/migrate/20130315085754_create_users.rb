class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :mail
      t.string :lang
      t.datetime :date

      t.timestamps
    end
  end
end
