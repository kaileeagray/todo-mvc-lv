class Item < ApplicationRecord
  belongs_to :list
  #adds associations, methods to model
  validates :description, presence: true


end
