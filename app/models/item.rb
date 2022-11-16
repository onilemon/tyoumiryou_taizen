class Item < ApplicationRecord
  has_one_attached :image
  attribute :average, :float
  has_many :uses
  has_many :attentions
  belongs_to :genre
end
