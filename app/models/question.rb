class Question < ApplicationRecord
  belongs_to :user

  scope :pending, -> { where.not(pending_at: nil) }
  scope :approved, -> { where.not(approved_at: nil) }
  scope :reproved, -> { where.not(reproved_at: nil) }
end
