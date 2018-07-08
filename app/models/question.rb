class Question < ApplicationRecord
  belongs_to :user

  validates :content, :source, :year, presence: true

  scope :pending, -> { where.not(pending_at: nil) }
  scope :approved, -> { where.not(approved_at: nil) }
  scope :reproved, -> { where.not(reproved_at: nil) }
end
