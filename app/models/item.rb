class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 3, maximum: 100 }, presence: true
end
