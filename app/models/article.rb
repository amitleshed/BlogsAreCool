class Article < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  after_create :create_vote

  def create_vote
    Vote.create article: self
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
