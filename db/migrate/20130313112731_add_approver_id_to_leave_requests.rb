class AddApproverIdToLeaveRequests < ActiveRecord::Migration
  def change
    add_column :leave_requests, :approver_id, :integer
  end
end
