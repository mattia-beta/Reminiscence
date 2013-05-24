class RemoveData < ActiveRecord::Migration
    def change
        remove_column :users, :date
    end
end
