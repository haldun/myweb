class Admin::PagesController < Admin::AdminController
  respond_to :html, :json
  before_filter :site_required!

  expose(:pages) { current_site.pages }
  expose(:page)

  def index
    respond_with pages
  end

  def show
    respond_with page
  end

  def new
    respond_with page
  end

  def edit
    respond_with page
  end

  def create
    flash.notice = 'Page was created successfully.' if page.save
    respond_with [:admin, page]
  end

  def update
    flash.notice = 'Page was updated successfully.' if page.save
    respond_with [:admin, page]
  end

  def destroy
    page.destroy
    respond_with [:admin, page]
  end
end
