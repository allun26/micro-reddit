class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: {minimum: 50}
  validates :body, presence: true
end
