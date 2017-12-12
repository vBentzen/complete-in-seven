class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 5, maximum: 100 }, presence: true
end
