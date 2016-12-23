class Tag < ActiveRecord::Base
  has_and_belongs_to_many :users

def self.search(parameter) 
  where("lower(name) LIKE ?", "%#{parameter.downcase}%")
end
end
