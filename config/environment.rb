# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

require 'tlsmail'
Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
