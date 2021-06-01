class Category < ApplicationRecord
    has_many :tasks
    validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 180}
    validates :description, length: {maximum: 1000}
    
end
