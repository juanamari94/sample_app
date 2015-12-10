class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) # if the user checked remember me, it'll save a cookie, otherwise it'll be a normal session
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
