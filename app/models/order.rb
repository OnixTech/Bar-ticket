class Order < ApplicationRecord
  belongs_to :station
  validates :table, presence: true
end
