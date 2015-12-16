class NotificationMailer < ApplicationMailer
  default from: 'theentropics@gmail.com'

  def notify(user)
    @user = user
    mail to: @user.mail, subject: I18n.translate('notification_mailer.subject')
  end
end
