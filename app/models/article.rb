class Article < ActiveRecord::Base
  belongs_to :user

  has_many :votes
  has_many :comments
  has_many :favorite_articles
  has_many :favorited_by, through: :favorite_articles, source: :user

  # after_create :create_vote

  # def create_vote
  #   Vote.create article: self
  # end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
