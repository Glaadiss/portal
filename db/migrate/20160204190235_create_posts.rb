class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :message_id
      t.integer :sender_id
      t.integer :recipient_id
      t.string :token
      
      t.timestamps null: false
    end
  end
end
