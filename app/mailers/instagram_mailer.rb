class InstagramMailer < ApplicationMailer
  def instagram_mail(feed)
    @feed = feed
    mail to: "#{@feed.user.email}", subject: 'insta cloneサイト投稿確認メール'
  end
end
