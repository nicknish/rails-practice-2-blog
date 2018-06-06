class Post < ApplicationRecord
  validates :name, :body, presence: true
  has_many :comments
end
