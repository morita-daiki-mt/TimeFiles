class Task < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  accepts_nested_attributes_for :histories
  mount_uploader :icon, ImageUploader
end
