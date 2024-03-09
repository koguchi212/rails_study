class Aim < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ["advantage", "created_at", "reason", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end