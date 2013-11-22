class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :albums
  before_create :set_member
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  ROLES = %w[member premium_member admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private

  def set_member
    self.role = 'member'
  end
end
