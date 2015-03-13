class WorkoutsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def home
  end

  def new
  	@workout = Workout.new
  end	

  def index
  	@workouts = Workout.all
    @favorites = Favorite.all
  end

  def create
  	@workout = current_user.workouts.new(workout_params)
    respond_to do |format|
    	if @workout.save
        format.html { redirect_to workouts_path, notice: 'Workout created yo!' }
    	else
    		redirect_to root_path
    	end
    end
  end

  def show
    @workout = Workout.find_by!(slug: params[:id])
  end

  def edit
    @workout = Workout.find_by!(slug: params[:id])
  end

  def update
    @workout = Workout.find_by!(slug: params[:id])
      respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to workouts_path, notice: 'Workout updated yo!' }
      else
        render @workout.errors
      end
    end
  end

  def destroy
    @workout = Workout.find_by!(slug: params[:id])
    @workout.destroy
    respond_to do |format|
      format.html {redirect_to workouts_path, notice: "Workout deleted yo!"}
    end
  end

  def favorite
      type = params[:type]
      if type == "favorite"
        current_user.favorites << @workout
        redirect_to :back, notice: 'You favorited #{@workout.name}'

      elsif type == "unfavorite"
        current_user.favorites.delete(@workout)
        redirect_to :back, notice: 'Unfavorited #{@workout.name}'

      else
        # Type missing, nothing happens
        redirect_to :back, notice: 'Nothing happened.'
      end
    end

  private

  def set_workout
    @workout = Workout.friendly.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:weight, :reps, :exercise, :user_id)
  end

end
