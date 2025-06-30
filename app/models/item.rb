class Item < ApplicationRecord
  belongs_to :user
  belongs_to :merchant

  validates :description, presence: true
  validates :price,  presence: true
  validates :merchant_id, presence: true
end