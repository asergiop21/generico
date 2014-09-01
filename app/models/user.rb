class User < ActiveRecord::Base

  ROLE = %w[Admin Invitado]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model

#  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,:lastname, :name, :username, :role_ids, :role_id, :current_password, :address, :cuit, :dni, :enabled, :role

  attr_accessor :current_password 
 
 # attr_accessible :title, :body
  validates_presence_of :username
  validates :password,  length: {maximum:30}, :allow_nil => true, :allow_blank => true, on: :update

 # has_and_belongs_to_many :role
  has_many :customer
  has_many :plan
  has_many :loan
  has_many :supplier
  has_many :ticket
  has_many :ticket_and_role
  has_many :accounts_receivable
 belongs_to :roles
 def role?(role)
    return !!self.role.find_by_role(role.to_s.camelize)
  end

  def to_s
    self.username
  end

  private
  def password_required?
  # If resetting the password
  return true if reset_password_token.present? && reset_password_period_valid?

   # If the person already has a pass, only validate if they are updating pass
  if !encrypted_password.blank?
    password.present? || password_confirmation.present?
  end

end
end
