class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def feed
    @tweet = Tweet.new
    # .find retrieves 1 record; .where retrieves all records that match the argument
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).order('created_at DESC')
    #@tweets is equal to every single tweet that is connected to either my userID or any of my friends' ids. 'user_id in (?)' is calling MULTIPLE records that associate with the current_user.friend_ids database AND user_id = ? is looking for a SINGLE userID in the current_user database.
  end
end
