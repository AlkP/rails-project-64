# frozen_string_literal: true

# OpenSSL::SSL.SSLContext.default_params[:verify_mode] = OpenSSL::SSL::VERIFY_NONE

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN', nil)
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.send_default_pii = false
end
