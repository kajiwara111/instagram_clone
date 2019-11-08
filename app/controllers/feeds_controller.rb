class FeedsController < ApplicationController
  before_action :correct_user, only: %i[edit update]

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
      InstagramMailer.instagram_mail(@feed).deliver
      redirect_to new_feed_path, notice: '正常に投稿されました'
    else
     render 'new'
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    if @feed.invalid? #validationエラー時は確認画面に遷移させない
      flash[:danger] = 'コメントの入力、画像の添付をしてください。'
      render 'new'
    end
  end

  def show
    @feed = Feed.find(params[:id])
    #login中のユーザーがお気に入りしている投稿がなければnil
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
  end

  def edit
    #@feed = Feed.new(feed_params) 
    #new(feed_paramsだとformのメソッドがpostになる。form_withの)
    #model: @feedの@feedの中身が既存テーブルに存在すればメソッドをpatchに切り替えてくれる
    #上記をrailsが自動で認識している
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    if @feed.update(feed_params)
      flash[:notice] = '投稿を更新しました'
      redirect_to feeds_path
    else
      flash[:danger] = '投稿の更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    redirect_to feeds_path, notice: '投稿を削除しました'
  end
  
  private

  def feed_params
    params.require(:feed).permit(:image, :image_cache, :content)
  end

  def correct_user
    @feed = Feed.find(params[:id])
    @user = @feed.user
    redirect_to feeds_path unless current_user?(@user)
  end
end
