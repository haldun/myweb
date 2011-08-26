class Site < ActiveRecord::Base
  # TODO Add name validation for subdomains
  validate :name, :presence => true, :uniqueness => true
  belongs_to :owner, :class_name => "User"
  belongs_to :current_theme, :class_name => "Theme", :foreign_key => "current_theme_id"
  has_many :pages, :dependent => :destroy
  has_many :themes, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  has_many :stylesheets
  has_many :images
  has_many :templates
  has_many :javascripts
  liquid_methods :name, :title, :tagline

  def to_s
    name
  end

  def self.fetch_by_name name
    Rails.cache.fetch("sites/#{name}") do
      find_by_name name
    end
  end
end
