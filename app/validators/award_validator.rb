class AwardValidator < ActiveModel::Validator
  def validate(record)
    if record.user == record.receiver
      record.errors[:receiver_id] << "You can't award points to yourself"
    end

    if record.points
      awarded_points = (record.user.awards.sum(:points) || 0)
      if (awarded_points + record.points) > (Setting.try(:points_per_participant) || 100)
        record.errors[:points] << "The award excedes your available points"
      end
    end

    if record.points
      if record.points < (Setting.try(:minimum_allocation) || 10)
        record.errors[:points] << "You must assign at least 10 points"
      end
    end
  end
end
