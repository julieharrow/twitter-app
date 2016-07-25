class AddAttachmentPicToTweets < ActiveRecord::Migration
  def self.up
    change_table :tweets do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :tweets, :pic
  end
end
