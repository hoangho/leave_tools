class LeaveRequest < ActiveRecord::Base
  attr_accessible :approver_id, :content, :end_time, :is_approved, :leave_type_id, :start_time, :title, :user_id

  belongs_to :leave_type
  belongs_to :user_request, class_name: "User"
  belongs_to :approver, class_name: "User"
end
