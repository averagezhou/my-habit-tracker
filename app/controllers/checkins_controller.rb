class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.all.order({ :created_at => :desc })

    render({ :template => "checkins/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @checkin = Checkin.where({:id => the_id }).at(0)

    render({ :template => "checkins/show.html.erb" })
  end

  def create
    @checkin = Checkin.new
    @checkin.habit_id = params.fetch("query_habit_id")

    if @checkin.valid?
      @checkin.save
      redirect_to("/checkins", { :notice => "Checkin created successfully." })
    else
      redirect_to("/checkins", { :notice => "Checkin failed to create successfully." })
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
    @checkin = Checkin.where({ :id => the_id }).at(0)

    @checkin.destroy

    redirect_to("/checkins", { :notice => "Checkin deleted successfully."} )
  end
end
