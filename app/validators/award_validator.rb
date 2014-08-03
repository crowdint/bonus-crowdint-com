class AwardValidator < ActiveModel::Validator
  def validate(record)
    if record.user == record.receiver
      record.errors[:receiver_id] << "You can't award points to yourself"
    end
  end
end
