class AddImageToSeniors < ActiveRecord::Migration
  def change
      rename_column :seniors, :url_photo, :image
  end
end
