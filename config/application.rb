require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.i18n.default_locale = :ja
    config.generators do |g|
      # この二行の記述でCSS, js, helper自動生成しない設定を作成しています。
      g.assets false
      g.helper false
      end
  end
end
