class Item < ApplicationRecord
  belongs_to :merchant
  has_many :purchases
  belongs_to :user

  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
