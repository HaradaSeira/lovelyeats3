class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
 #enum role: { general: 0, admin: 1 }
 
 has_many :shops
 has_many :items
 
 
 serialize :roles, Array
 
  def initialize(*args)
    super
    self.roles ||= [] # roles を初期化する
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
    role == "customer"
  end
  
end