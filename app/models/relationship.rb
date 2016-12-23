class Relationship < ActiveRecord::Base
  belongs_to :following, class_name: 'User', foreign_key: :following_id
  belongs_to :follow, class_name: 'User', foreign_key: :followed_id

  # def self.create_follow(following_id, follow_id)
  #   create(following_id: following_id, followed_id: follow_id)
  # end
end
