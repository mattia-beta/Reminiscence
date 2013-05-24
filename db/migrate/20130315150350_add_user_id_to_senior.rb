class AddUserIdToSenior < ActiveRecord::Migration
  def change
    add_column :seniors, :user_id, :integer
  end
end
