class History < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :user_id, presence: true
  validates :task_id, presence: true
  validates :action_at, presence: { message: "日付を登録してください" }, uniqueness: { scope: :task_id, massage: "同じ日付は登録できません" }
  validate :action_at_be_in_the_future

  def action_at_be_in_the_future
    if action_at.present? && action_at > Date.today
      errors.add(:action_at, "未来の日付は登録できません。")
    end
  end

  def start_time
    action_at
  end
end
