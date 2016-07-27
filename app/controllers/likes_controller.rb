class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.likes.where(user_id: current_user.id).first_or_create
    # first_or_create ensures that users can only complete an action once - either return first instance of the 'like' OR will create a new one if one does not already exist
    redirect_to request.referrer, notice: "You've liked this tweet!"
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.likes.find_by(user_id: current_user.id).destroy
    redirect_to request.referrer
  end
end
