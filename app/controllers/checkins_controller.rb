class CheckinsController < ApplicationController
  def index
    @checkins = @current_user.habits.habit_checkins({ :created_at => :desc })

    render({ :template => "checkins/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @checkin = Checkin.where({:id => the_id }).at(0)

    render({ :template => "checkins/show.html.erb" })
  end

  def create
    @checkin = Checkin.new
    the_id = params.fetch("path_id")
    @checkin.habit_id = the_id
    current_habit = Habit.where({ :id => the_id }).at(0)

    if current_habit.checkin_today == FALSE
      if @checkin.valid?
        @checkin.save
        redirect_to("/adjust_habit/"+the_id)

      end
      

    else
      redirect_to("/habits", { :notice => "Checkin failed to create successfully." })
    end

  end

  def update
    the_id = params.fetch("path_id")
    @checkin = Checkin.where({ :id => the_id }).at(0)

    @checkin.habit_id = params.fetch("query_habit_id")

    if @checkin.valid?
      @checkin.save
      redirect_to("/checkins/#{@checkin.id}", { :notice => "Checkin updated successfully."} )
    else
      redirect_to("/checkins/#{@checkin.id}", { :alert => "Checkin failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    habit_id = params.fetch("habit_id")
    @checkin = Checkin.where({ :id => the_id }).at(0)

    @checkin.destroy

    redirect_to("/habits/"+habit_id, { :notice => "Checkin deleted successfully."} )
  end
end
