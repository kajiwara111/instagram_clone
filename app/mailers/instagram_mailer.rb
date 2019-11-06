class InstagramMailer < ApplicationMailer
  def instagram_mail(feed)
    @feed = feed
    mail to: 'kaji_pharm@yahoo.co.jp', subject: 'insta cloneサイト投稿確認メール'
  end
end
