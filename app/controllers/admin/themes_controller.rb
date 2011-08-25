class Admin::ThemesController < Admin::AdminController
  respond_to :html, :json
  before_filter :site_required!

  expose(:themes) { current_site.themes.page params[:page] }
  expose(:theme)

  def index
    respond_with themes
  end

  def show
    respond_with theme
  end

  def new
    respond_with theme
  end

  def edit
    respond_with theme
  end

  def create
    flash.notice = 'Theme was created successfully.' if theme.save
    respond_with theme
  end

  def update
    flash.notice = 'Theme was updated successfully.' if theme.save
    respond_with theme
  end

  def destroy
    theme.destroy
    respond_with theme
  end

  def publish
    theme.publish!
    respond_with theme
  end
end
