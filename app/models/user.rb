class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_and_belongs_to_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def User.search(parameter) 
  where("users.username LIKE ?", "%#{parameter}%")
  end
end