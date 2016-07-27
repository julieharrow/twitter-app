class User < ActiveRecord::Base

  # associations
  has_many :tweets
  has_many :relationships
  has_many :friends, through: :relationships
  # "through" actually defines a new path through a specific table, in this case it is the join table - relationships

  # we could technically add "class_name: "Class" for all of the association lines of code because it is just saying which class to which the symbol belongs.  Necessary when we define a new association such as :invers_relationships
  has_many :inverse_relationships, class_name: "Relationship", foreign_key: "friend_id" #'foreign key helps the code understand that friend_id is the user_id for the purposes of this relationship'
  has_many :inverse_friends, through: :inverse_relationships, source: :user
  # we must define the 'source: user' rather than use the key words 'class_name: user' here because this is a 'has_many...through'. the fact that it is a -through- means that we use different key words

  has_many :likes
  def likes?(tweet)
    tweet.likes.where(user_id: id).any?  #looks for the user.id and returns true or false via 'any?'
  end

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
