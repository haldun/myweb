class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_site

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_site
    @current_site ||= Site.find_by_slug(request.subdomain) if request.subdomain.present?
  end

  def site_required!
    if current_site.nil?
      redirect_to sites_url
    end
  end
end
