class CreateTagsUsers < ActiveRecord::Migration
  def change
    create_table :tags_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true
    end
  end
end
