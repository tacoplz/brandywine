Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true


#the below code snippits initializes smtp and tls. This is required to send any emails using the stmp config below
  require 'net/smtp'

    module Net
      class SMTP
        def tls?
          true
        end
      end
    end

  #the below code sets the delivery method to smtp
  config.action_mailer.delivery_method = :smtp

  #set the host to the dns of the instance
  host = 'ec2-54-201-124-144.us-west-2.compute.amazonaws.com'
  config.action_mailer.default_url_options = { host: host }
  #configure the actionmailer smtp settings
  #note: when working in sandbox make sure the receipiant email and sender email address have been verified
  config.action_mailer.smtp_settings = {
    #since the instance is hosted in the west (oregon) must use the stmp host for west region
    :address        => 'email-smtp.us-west-2.amazonaws.com',
    #tls sends email on port 465. Make sure this port is available for outbound on amazon security groups and vpc ACLs
    :port           => '465',
    :domain         => 'example.com',
    #this is the amazon SES username and password that is generated in the SES management console
    :user_name      => ,
    :password       => ,
    :authentication => :login,
    :enable_starttls_auto => true
  }

=begin
#  Config mail delivery
  host = 'yahoo.com'
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:        "smtp.bizmail.yahoo.com",
    port:           587,
    user_name:      "brandywinefurniture",
    password:       "",
    enable_starttls_auto: true,
    authentication: :plain
  }
=end

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like
  # NGINX, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
