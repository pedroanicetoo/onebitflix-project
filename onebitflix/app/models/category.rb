class Category < ApplicationRecord
  has_many :movies
  has_many :series, class_name: "Serie"

  validates :name, presence: true, uniqueness: true
end
