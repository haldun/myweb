class HomeController < ApplicationController
  before_filter :site_required!

  def index
    @presenter = HomePresenter.new current_site
    render :text => @presenter.render
  end
end
