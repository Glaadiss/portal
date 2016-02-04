class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title 
      t.text :description
      t.integer :user_id
      t.string :token
      t.timestamps null: false
    end
  end
end
