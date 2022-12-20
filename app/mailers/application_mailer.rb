class ApplicationMailer < ActionMailer::Base
  default from: ENV['USER_NAME'] #ENV['MY_ADDRESS']
  #default from: Rails.application.credentials.gmail[:user_name]
  layout 'mailer'
end
