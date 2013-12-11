class Notifier < ActionMailer::Base
  def send_invite(to, organization)
    @organization = organization
    mail(to: to, subject: "You were invited to the #{organization.name}'s Bonus Batch")
  end
end
