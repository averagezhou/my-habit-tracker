namespace(:dev) do
  desc "Hydrate the database with some dummy data to look at so that developing is easier"
  task({ :prime => :environment}) do
    u = User.new
    u.email = "bob@example.com"
    u.username = "bob"
    u.password = "password"
    u.save

    h = Habit.new
    h.name = "Journal"
    h.owner_id = u.id
    h.first_day = Date.today
    h.time_of_day = Time.now
    h.save

    h = Habit.new
    h.name = "Call Mom"
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

  end
end
