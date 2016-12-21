class CreateUsersTags < ActiveRecord::Migration
  def change
    create_table :users_tags, :id => false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
