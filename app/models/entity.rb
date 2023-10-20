class Entity < ApplicationRecord
  validates :name, presence: true
  validates :groups, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  has_and_belongs_to_many :groups
end
