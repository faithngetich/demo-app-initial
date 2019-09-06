class SessionsController < Clearance::SessionsController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticated?(params[:password])
      # Saves the user ID in the session as the  pre_2fa  auth  id
      session[:pre_2fa_auth_user_id] = @user.id
      # Details of the approval request sent to the user
      one_touch = Authy::OneTouch.send_approval_request(
        id: @user.authy_id,
        message: 'Request to Login to Twilio demo app',
        details: {
          'Email Address' => @user.email
        }
      )
      # Update the status if the sent_approval_request is successful
      status = one_touch['success'] ? :onetouch : :sms
      @user.update(authy_status: status)
      render json: { success: one_touch['success'] }
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
 end
 