# == Schema Information
#
# Table name: habits
#
#  id            :integer          not null, primary key
#  checkin_count :integer          default(0)
#  checkin_today :boolean          default(FALSE)
#  first_day     :date
#  name          :string
#  time_of_day   :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#

class Habit < ApplicationRecord
  belongs_to :owner, :class_name => "User"
  has_many :habit_checkins, :class_name => "Checkin", :dependent => :destroy
  validates :time_of_day, :presence => true
  validates :name, :presence => true
  validates :first_day, :presence => true

end
