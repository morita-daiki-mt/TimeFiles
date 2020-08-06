class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :task_id
      t.date :action_at
      t.timestamps
    end
  end
end
