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
    else
      render :new
    end
  end
end
