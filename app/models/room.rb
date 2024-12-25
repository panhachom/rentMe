class Room < ApplicationRecord
  belongs_to :user
  has_one :receipt, through: :user
end
