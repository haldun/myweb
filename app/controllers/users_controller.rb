class UsersController < ApplicationController
  respond_to :html
  expose(:user)

  def new
    user.owned_sites.build
    respond_with user
  end

  def create
    if user.save
      flash.notice = "Signed up!"
      session[:user_id] = user.id
      redirect_to admin_pages_url(:subdomain => user.owned_sites.last.name)
    else
      render :new
    end
  end
end
