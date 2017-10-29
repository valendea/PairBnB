class CreateCreateGoogleAuths < ActiveRecord::Migration[5.1]
  def change
    create_table :create_google_auths do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
