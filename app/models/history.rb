class History < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :action_at, presence: { message: "日付を登録してください" }, on: :create
end
