namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    u = User.new
    u.email = "sara@example.com"
    u.password = "password"
    u.save

    h = Habit.new
    h.name = "Call mom"
    h.owner_id = u.id
    h.time_of_day = Time.now
    h.save
    
    c = Checkin.new
    c.habit_id = h.id
    c.save

  end
end
