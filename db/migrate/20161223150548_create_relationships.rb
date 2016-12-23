class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :followed_id
      t.integer :following_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :relationships, :followed_id
    add_index :relationships, :following_id
    add_index :relationships, [:followed, :following_id], unique: true
  end
end
