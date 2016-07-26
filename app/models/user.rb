class User < ActiveRecord::Base

  # associations
  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships

  # validations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #required validation for paperclip images
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # validates :username, presence: true
  # validates :username, uniqueness: true
  # or the dry way...
  validates(:username, presence: true, uniqueness: true)

  # validations and associations belong together on the page ^^
end
