class LeaveRequestsController < ApplicationController
  def new
    @new_leave = LeaveRequest.new
    @leave_types = LeaveType.all
    @managers = User.where('user_type_id = ?', 2)
  end

  def create
    @leave_request = LeaveRequest.new(params[:new_leave])
    @leave_request.is_approved = false
    @leave_request.user_id = current_user.id
    if @leave_request.save
      #process create leave request successfully here
      flash[:success] = "Your request is created and sent to your manager"
      redirect_to @leave_request
      puts '------',@leave_request.leave_type_id
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @leave_requests = LeaveRequest.all
  end

  def update
  end

  def destroy
  end
end
