class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.text :src
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
