class AddImageToMemory < ActiveRecord::Migration
  def change
      add_column :memories, :image, :string
  end
end
