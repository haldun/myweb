class SitesController < ApplicationController
  respond_to :html, :json

  expose(:sites) { Site.all }
  expose(:site)

  def index
    respond_with sites
  end

  def show
    respond_with site
  end

  def new
    respond_with site
  end

  def edit
    respond_with site
  end

  def create
    flash.notice = 'Site was created successfully.' if site.save
    respond_with site
  end

  def update
    flash.notice = 'Site was updated successfully.' if site.save
    respond_with site
  end

  def destroy
    site.destroy
    respond_with site
  end
end
