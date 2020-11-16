class Task < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  accepts_nested_attributes_for :histories
  mount_uploader :icon, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 20 }
  validates :memo, length: { maximum: 400 }
end
