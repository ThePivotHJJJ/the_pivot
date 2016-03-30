class UserNotifier < ApplicationMailer
  def inform(email)
    @email = email
    mail(to: email, subject: "You've won a bid on PABOI!")
  end
end
