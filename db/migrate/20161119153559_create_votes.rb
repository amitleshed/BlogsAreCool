class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :article
      t.timestamps null: false
    end
  end
end
