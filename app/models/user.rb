class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :display_name, :owned_sites_attributes
  has_secure_password
  has_many :owned_sites, :class_name => "Site", :foreign_key => "owner_id"
  accepts_nested_attributes_for :owned_sites
  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create

  def to_s
    display_name || email
  end
end
