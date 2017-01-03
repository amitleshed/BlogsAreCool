class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  after_create do
   comment = Comment.find_by(id: self.id)
   hashtags = self.description.scan(/@\w+/)
  end
end
