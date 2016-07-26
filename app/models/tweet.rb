class Tweet < ActiveRecord::Base
  belongs_to :user
  validates(:message, presence: true, length: {maximum: 140, too_long: "A tweet is only 140 characters long."})
  validates(:message, presence: true, length: {minimum: 5, too_short: "A tweet must be at least 5 characters long."})
  has_attached_file :pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

  # validations and associations belong together on the page ^^




end
