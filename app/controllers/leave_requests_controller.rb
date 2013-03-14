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
      Notifier.registration_confirmation(@leave_request).deliver
      # Notifier.email_friend(@leave_request, current_user.full_name, 
      #     current_user.email).deliver
      flash[:success] = "Your request is created and sent to your manager"
      redirect_to @leave_request
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

  def notify_friend
    @leave_request = LeaveRequest.find(params[:id])
    Notifier.email_friend(@leave_request, params[:name], params[:email]).deliver
    redirect_to @leave_request, :notice => "Successfully sent a message to your friend"
end
end
