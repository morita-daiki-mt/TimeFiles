class RemoveUserIdFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :user_id, :integer
  end
end
