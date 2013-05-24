class CreateSeniors < ActiveRecord::Migration
  def change
    create_table :seniors do |t|
      t.string :name
      t.string :surname
      t.datetime :birthday
      t.string :city
      t.string :url_photo

      t.timestamps
    end
  end
end
