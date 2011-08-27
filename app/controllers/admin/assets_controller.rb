class Admin::AssetsController < Admin::AdminController
  respond_to :html, :json
  before_filter :site_required!
  before_filter :asset_type_required!, :only => [:new, :create, :update]

  expose(:themes) { current_site.themes }

  expose(:theme) do
    params[:theme_id].present? ? themes.find(params[:theme_id]) : asset.theme
  end

  expose(:assets) do
    method_name = asset_type.present? ? asset_type.pluralize.to_sym : :assets
    if params[:theme_id].present?
      theme.send(method_name)
    else
      current_site.send(method_name)
    end
  end

  expose(:asset) do
    if id = params[:id]
      assets.find(id).tap do |r|
        r.attributes = params[asset_type] unless request.get?
      end
    else
      assets.build(params[asset_type])
    end
  end

  def asset_type
    @asset_type ||= params[:type] && params[:type].downcase
  end
  helper_method :asset_type

  def asset_type_required!
    if asset_type.nil?
      redirect_to theme
    end
  end

  def index
    respond_with assets
  end

  def show
    respond_with asset
  end

  def new
    respond_with asset
  end

  def edit
    respond_with asset
  end

  def create
    flash.notice = 'Asset was created successfully.' if asset.save
    respond_with [:admin, asset]
  end

  def update
    flash.notice = 'Asset was updated successfully.' if asset.save
    respond_with [:admin, asset]
  end

  def destroy
    asset.destroy
    redirect_to admin_theme_assets_path(theme)
  end
end
