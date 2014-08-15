Given(/^an award for "(.*?)" has been given to "(.*?)"$/) do |points, name|
  user = User.last
  receiver = User.where(name: name).first

  Fabricate(:award, user: user, receiver: receiver, points: points, event: Event.last)
end
