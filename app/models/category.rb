class Category < ApplicationRecord
    has_many :troubles
    validates :name, presence: true, uniqueness: true
end
