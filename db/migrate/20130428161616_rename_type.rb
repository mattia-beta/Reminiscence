class RenameType < ActiveRecord::Migration
    def change
        rename_column :things, :type, :kind
    end
end
