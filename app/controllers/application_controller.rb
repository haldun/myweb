class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_site

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_site
    @current_site ||= Site.find_by_name(request.subdomain) if request.subdomain.present?
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to login_url, :alert => "You must first log in to access this page"
    end
  end

  def site_required!
    if current_site.nil?
      redirect_to sign_up_url(:subdomain => 'www')
    end
  end
end
