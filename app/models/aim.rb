require "csv"

class Aim < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  def self.csv_attributes
    ["title", "advantage", "reason", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |aim|
        csv << csv_attributes.map{ |attr| aim.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      aim = new
      aim.attributes = row.to_hash.slice(*csv_attributes)
      aim.save!
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["advantage", "created_at", "reason", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end