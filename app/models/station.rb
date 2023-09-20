class Station < ApplicationRecord
  belongs_to :company
  has_many :order
  validates :name, presence: true
end
