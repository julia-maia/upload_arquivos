class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item

  scope :filtered_by_purchaser, ->(name) {
    return all if name.blank?

    joins(:purchaser).where("purchasers.name ILIKE ?", "%#{name}%")
  }

  validates :count, presence: true, numericality: { greater_than: 0 }
end
