class Task < ApplicationRecord
  belongs_to :user
  has_many :histories, dependent: :destroy
  accepts_nested_attributes_for :histories
  mount_uploader :icon, ImageUploader
  validates :content, presence: true, length: { maximum: 20 }, uniqueness: { scope: :user_id, massage: "同じタスク名は登録できません" }
  validates :memo, length: { maximum: 400 }
end
