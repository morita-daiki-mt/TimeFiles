class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :content
      t.string :icon
      t.text :memo
      t.timestamps
    end
  end
end
