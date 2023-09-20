class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
 
  has_many :shops
  has_many :items
  
  has_many :favorites
  has_many :favorited_items, through: :favorites, source: :item

  serialize :roles, Array
  
  attr_accessor :custom_field
  
  after_initialize :initialize_roles

  def initialize_roles
    self.roles ||= []
  end

  def add_role(role)
    self.roles ||= []
    self.roles << role unless self.roles.include?(role)
  end

  def remove_role(role)
    self.roles -= [role]
  end

  def has_role?(role)
    self.roles.include?(role.to_s)
  end

  def customer?
    has_role?("customer") # メソッド内でroleではなくhas_role?メソッドを使用する
  end
end
