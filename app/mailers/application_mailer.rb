class ApplicationMailer < ActionMailer::Base
  default from: ENV['MY_ADDRESS']#ENV['USER_NAME'] #
  #default from: Rails.application.credentials.gmail[:user_name]
  layout 'mailer'
end
