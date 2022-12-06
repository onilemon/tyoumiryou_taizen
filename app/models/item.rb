class Item < ApplicationRecord
  has_one_attached :image
  attribute :average, :float
  has_many :attentions
  has_many :posts, dependent: :destroy
  belongs_to :genre
end
