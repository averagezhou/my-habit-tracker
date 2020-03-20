namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    u = User.new
    u.email = "dan@example.com"
    u.username = "dan"
    u.password = "password"
    u.save

    h = Habit.new
    h.name = "Journal"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

    h = Habit.new
    h.name = "Workout"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

    h = Habit.new
    h.name = "Floss"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

    h = Habit.new
    h.name = "Go to Sleep Early"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

    h = Habit.new
    h.name = "Call Catie"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

  end
end
