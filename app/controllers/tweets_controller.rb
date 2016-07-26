class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @t = Tweet.all
    # define your array of tweets as anything you want - usable in the index page
  end

  def show
    @tweet = Tweet.find(params[:id])
    # params is a rails method that will retrieve the id from the URL
  end

  def edit
  end

  def new
    @tweet = Tweet.new
  end

  def update
    if @tweet.update(tweet_params)  # gets the appropriate @tweet instance through the 'set_tweet' method called in the 'before action' call above.  'update' is an active record call - rails knows what to do
      redirect_to @tweet, notice: "Your tweet has been updated."
    else
      render :edit
    end
  end

  def create
    @tweet = Tweet.new(tweet_params) # uses the private method below to build out the new tweet
    if @tweet.save
      redirect_to @tweet, notice: "Your tweet was successfully created."
      # @tweet is a shortcut for tweet_path(@tweet)
    else
      render :new
    end
  end

  def destroy
    @tweet.destroy # gets the appropriate @tweet instance through the 'set_tweet' method called in the 'before action' call above.  'destroy' is an active record call - rails knows what to do
    redirect_to tweets_path
  end

  private
  # restricts use of the methods/actions below this line by any other class but THIS class, including any inheriting classes

  def set_tweet
    @tweet = Tweet.find(params[:id])
    # called via the 'before_action' piece before the page actulally loads --> called a callback
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id, :pic)
  end

end
