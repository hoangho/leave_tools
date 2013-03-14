class Notifier < ActionMailer::Base
  default from: "hthoang88@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(leave_request, sender_name, receiver_email)
    @leave_request, = leave_request
    @sender_name = sender_name
    mail :to => receiver_email, :subject => "Created request"

    puts @leave_request
    puts receiver_email
  end



  def registration_confirmation(leave_request)
    # to:   User.find(leave_request.user_id).email
    # from:        "hthoang88@gmail.com"
    # subject:     "Thank you for Registering"
    # body:        "ZXXX"
    mail :to => User.find(leave_request.user_id).email, :subject => "Created request"
  end


end
