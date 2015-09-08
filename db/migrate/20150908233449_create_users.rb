class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :uid
      t.string :provider
      t.string :image_url
      t.string :bio
      t.string :website
      t.string :token

      t.timestamps null: false
    end
  end
end
