class RemoveAppoverIdFromLeaveRequests < ActiveRecord::Migration
  def up
    remove_column :leave_requests, :appover_id
  end

  def down
    add_column :leave_requests, :appover_id, :string
  end
end
