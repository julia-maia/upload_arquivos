class Purchaser < ApplicationRecord
  has_many :purchases
  belongs_to :user
  validates :name, presence: true
end
