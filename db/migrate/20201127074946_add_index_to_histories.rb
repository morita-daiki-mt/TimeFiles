class AddIndexToHistories < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :histories, :tasks
    add_foreign_key :tasks, :users
  end
end
