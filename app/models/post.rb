class Post < ApplicationRecord
  belongs_to :user
  belongs_to :item
end

# validates :comment, presence: true