# == Schema Information
#
# Table name: checkins
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  habit_id   :integer
#

class Checkin < ApplicationRecord
  belongs_to :associated_habit, :class_name => "Habit", :foreign_key => "habit_id"

end
