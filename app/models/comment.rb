class Comment < ApplicationRecord
  validates :name, :email, :body, presence: true
  belongs_to :post
end
