class ContactMailer < ApplicationMailer
  def contact_mail(post_user_id)
    @contact = post_user_id
    mail to: @contact.user.email, subject: 'お知らせ'
  end
end
