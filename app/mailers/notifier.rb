class Notifier < ActionMailer::Base
  default from: 'bonus_batch_roboth@crowdint.com'

  def send_invite(to, organization)
    @organization = organization
    mail(to: to, subject: "You were invited to the #{organization.name}'s Bonus Batch")
  end
end
