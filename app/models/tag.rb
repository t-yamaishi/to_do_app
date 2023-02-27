class Tag < ApplicationRecord
  validates :name, { presence: true }
  validates :name, length: { minimum: 1, maximum: 10 }
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, source: :post
end
