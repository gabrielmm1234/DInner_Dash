class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :profile
  has_many :orders
  validates :first_name, presence: true

  def admin?
    self.profile.name == "Administrador" || self.profile.name == "Admin"
  end

end
