class SessionsController < ApplicationController
  # skip_before_filter :verify_authenticity_token

  def new
  	@title_page = "Sign in"
    #save root link to redirect when login susscessully
    # session[:redirect_to] = request.root_url

    response.headers['WWW-Authenticate'] = Rack::OpenID.build_header(
        :identifier => "https://www.google.com/accounts/o8/id",
        :required => ["http://axschema.org/contact/email",
                      "http://axschema.org/namePerson/first",
                      "http://axschema.org/namePerson/last"],
        :return_to => session_url,
        :method => 'POST')
    head 401
  end

  # def create
  # 	user = User.find_by_email(params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     # Sign the user in and redirect to the user's show page.
  #     sign_in user
  #     redirect_to user
  #   else
  #     flash[:error] = 'Invalid email/password combination' # Not quite right!
  #     render 'new'
  #   end
  # end

  def create
    if openid = request.env[Rack::OpenID::RESPONSE]
      case openid.status
      when :success
        ax = OpenID::AX::FetchResponse.from_success_response(openid)
        user = User.where(:identifier_url => openid.display_identifier).first
        user ||= User.create!(:identifier_url => openid.display_identifier,
                              :email => ax.get_single('http://axschema.org/contact/email'),
                              :first_name => ax.get_single('http://axschema.org/namePerson/first'),
                              :last_name => ax.get_single('http://axschema.org/namePerson/last'))
        sign_in user
        if user.first_name.blank?
          redirect_to edit_user_path(user)
        else
          redirect_to(session[:redirect_to] || root_path)
        end
      when :failure
        render :action => 'problem'
      end
    else
      redirect_to new_session_path
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
    puts '----------Destroy of #{self.class.to_s}'
  end
end
