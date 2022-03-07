class Part < ApplicationRecord
  before_save :downcase_name

  validates :name, presence: true, uniqueness: true
  validates :price, :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :by_name, -> { order(:name) }

  private

  def downcase_name
    self.name = name.downcase
  end
end
