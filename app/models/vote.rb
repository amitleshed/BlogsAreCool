class Vote < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :article, dependent: :destroy
  after_create :initialize_variables

  def initialize_variables
    self.up = 0
    self.down = 0
    self.save
  end

  def upvote
    self.up += 1 
  end

  def downvote
    self.down -= 1
  end
end
