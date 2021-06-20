class ApplicationController < ActionController::Base
  
  helper_method(:current_user) # require login is not here becuase we are only using it in the controllers not the views

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to '/login' if !current_user
  end
end
