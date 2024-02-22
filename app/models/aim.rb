class Aim < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["advantage", "created_at", "difficulty", "id", "reason", "title", "updated_at"]
  end
end
