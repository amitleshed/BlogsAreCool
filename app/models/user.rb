class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :votes
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(parameter) 
  where("users.username LIKE ?", "%#{parameter}%")
  end

   def vote(article_id)
     vote = self.votes.create(article_id: article_id)
     vote.save
   end

def voted?(article_id)
  unless self.votes.where(article_id: article_id).first
    return false
  end
  return true
end

   def comment(article_id)
    comment = self.comments.create(article_id: article_id)
    comment.save
  end
end