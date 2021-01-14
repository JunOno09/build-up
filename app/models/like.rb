class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record
  
  validates :user_id, uniqueness: { scope: :record_id}
  # validates :user_id,uniqueness: true
  # validates :record_id,uniqueness: true
end
