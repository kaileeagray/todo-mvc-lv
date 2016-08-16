class List < ApplicationRecord
  has_many :items
  # this adds methods to my model.
  # association convention
  # list.items is calling collection which returns an array of all the associated objects
  validates :name, presence: true
end
