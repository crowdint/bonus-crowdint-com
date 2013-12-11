module ApplicationHelper
  def current_user_data
    { id: current_user.id }.to_json
  end
end
