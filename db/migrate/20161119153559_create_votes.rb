class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :up
      t.integer :down
      t.references :article

      t.timestamps null: false
    end
    create_table :users_votes do |t|
      t.references :vote
      t.references :user

      t.timestamps null: false
    end
  end
end
