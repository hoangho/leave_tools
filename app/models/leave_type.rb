class LeaveType < ActiveRecord::Base
  attr_accessible :cost, :name

  has_many :leave_requests
end
