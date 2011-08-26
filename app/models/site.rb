class Site < ActiveRecord::Base
  # TODO Add name validation for subdomains
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :owner, :class_name => "User"
  belongs_to :current_theme, :class_name => "Theme", :foreign_key => "current_theme_id"
  has_many :pages, :dependent => :destroy
  has_many :themes, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  has_many :stylesheets
  has_many :images
  has_many :templates
  has_many :javascripts
  after_save { Rails.cache.write "sites/#{name}", self }
  after_destroy { Rails.cache.delete "sites/#{name}" }

  liquid_methods :name, :title, :tagline

  def to_s
    name
  end

  def self.fetch_by_name name
    Rails.cache.fetch("sites/#{name}") do
      find_by_name name
    end
  end

  def after_save
    logger.info "Site after save"
  end
end
