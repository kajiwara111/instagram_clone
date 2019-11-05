class FeedsController < ApplicationController
  def index
    @feeds = Feed.all.order(id: 'DESC')
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def create
    #@feed = Feed.new(feed_params)
    #@feed.user_id = current_user.id
    @feed = current_user.feeds.build(feed_params)
    if @feed.save
      redirect_to new_feed_path
    else
      render 'new'
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
  end

  def show
  end
  
  def destroy
  end
  private

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :content)
  end
end
