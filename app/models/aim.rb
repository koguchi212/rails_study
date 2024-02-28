class Aim < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ["advantage", "created_at", "difficulty", "id", "reason", "title", "updated_at"]
  end
end