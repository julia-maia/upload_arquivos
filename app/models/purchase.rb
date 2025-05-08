class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item

  validates :count, presence: true, numericality: { greater_than: 0 }
end
