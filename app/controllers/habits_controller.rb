class HabitsController < ApplicationController
  def index
    @habits = Habit.all.order({ :created_at => :desc })

    render({ :template => "habits/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @habit = Habit.where({:id => the_id }).at(0)
    if @habit.owner_id == @current_user.id 
      render({ :template => "habits/show.html.erb" })
    else 
      redirect_to("/habits", { :notice => "You do not have access to this page" })
    end
  end

  def create
    @habit = Habit.new
    @habit.name = params.fetch("query_name")
    @habit.time_of_day = params.fetch("query_time_of_day")
    @habit.first_day = Date.today
    @habit.owner_id = @current_user.id

    if @habit.valid?
      @habit.save
      redirect_to("/habits", { :notice => "Habit created successfully." })
    else
      redirect_to("/habits", { :notice => "Habit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @habit = Habit.where({ :id => the_id }).at(0)

    @habit.name = params.fetch("query_name")
    @habit.time_of_day = params.fetch("query_time_of_day")

    if @habit.valid?
      @habit.save
      redirect_to("/habits/#{@habit.id}", { :notice => "Habit updated successfully."} )
    else
      redirect_to("/habits/#{@habit.id}", { :alert => "Habit failed to update successfully." })
    end
  end

  def adjust
    the_id = params.fetch("path_id")
    @habit = Habit.where({ :id => the_id }).at(0)
    @habit.checkin_today = TRUE

    if (Date.today - @habit.first_day) >= @habit.checkin_count
      @habit.checkin_count = @habit.checkin_count + 1
    else
      @habit.checkin_count = 0
      @habit.first_day = Date.today
    end

    if @habit.valid?
      @habit.save
      redirect_to("/habits/#{@habit.id}", { :notice => "Checkin updated successfully."} )
    else
      redirect_to("/habits/#{@habit.id}", { :alert => "Checkin failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @habit = Habit.where({ :id => the_id }).at(0)

    @habit.destroy

    redirect_to("/habits", { :notice => "Habit deleted successfully."} )
  end

end
