class AddProfilePhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :photo, :json
  end
end
