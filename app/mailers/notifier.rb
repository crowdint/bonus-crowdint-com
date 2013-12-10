class Notifier < ActionMailer::Base
  def send_invite(to, organization)
    mail(to: to, subject: "You were invited to the #{organization}'s Bonus Batch")
  end
end
