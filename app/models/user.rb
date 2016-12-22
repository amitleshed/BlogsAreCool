class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :votes
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300#", small: "100x100#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :username, uniqueness: true

  after_create do
   user = User.find_by(id: self.id)
   hashtags = self.about.scan(/#\w+/)
   hashtags.uniq.map do |hashtag|
    tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
    user.tags << tag
   end
  end

  before_update do
    user = User.find_by(id: self.id)
    user.tags.clear
    hashtags = self.about.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      user.tags << tag
   end
  end

  def self.search(parameter) 
  where("lower(tag.name) LIKE ?", "%#{parameter.downcase}%")
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