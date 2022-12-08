class ApplicationMailer < ActionMailer::Base
  default from: ENV["MY_ADDRESS"]
  layout 'mailer'
end
