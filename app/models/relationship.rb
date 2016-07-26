class Relationship < ActiveRecord::Base
  belongs_to :user #this is the user that initiates the application
  belongs_to :friend, class_name: "User" #this is the user being followed
end
