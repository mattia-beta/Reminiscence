class AddFacebook < ActiveRecord::Migration
    def change
        add_column :users, :id_facebook, :string
    end
end
