class Transaction < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true # foreign key
end
