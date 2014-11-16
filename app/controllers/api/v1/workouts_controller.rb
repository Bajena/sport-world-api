class Api::V1::WorkoutsController < Api::V1::BaseController
  def index
    @workouts = paginated_collection(filtered_collection)

    render_paginated_collection(@workouts)
  end

  def my_workouts
    @workouts = paginated_collection(Workout.user(@current_user))

    render_paginated_collection(@workouts)
  end

  def show
    if !params[:id] || !(@workout = Workout.find_by_id(params[:id]))
      render json: { message: 'Invalid id'}, status: :bad_request
    else
      render json: @workout, includes: serializer_includes_list
    end
  end

  def destroy
    if !params[:id] || !(@workout = Workout.find_by_id(params[:id])) || @workout.user != @current_user
      render json: { message: 'Invalid id'}, status: :bad_request
    else
      Workout.destroy(@workout)
      render json: { message: 'Workout deleted'}
    end
  end

  def create
    @workout = @current_user.workouts.create(workout_params(params))

    if @workout
      render json: @workout
    else
      render json: @workout.errors.messages
    end
  end

  def update
    if !params[:id] || !(@workout = Workout.find_by_id(params[:id])) || @workout.user != @current_user
      render json: { message: 'Invalid id'}, status: :bad_request
      return
    end

    @workout.update(workout_params(params))

    if @workout
      render json: @workout
    else
      render json: @workout.errors.messages
    end
  end

  private

  def render_paginated_collection(collection)
    render json: collection, serializer: PaginatedSerializer, each_serializer: WorkoutSerializer, includes: serializer_includes_list
  end

  def serializer_includes_list
    inclusions = params[:include] || []
    {
      include_sport: inclusions.include?('sport'),
      include_user: inclusions.include?('user')
    }
  end

  def filter_params(params)
    params.slice(:sport, :user)
  end

  def workout_params(params)
    params.require(:workout).permit(:title, :description, :start_date, :end_date, :distance, :sport_id)
  end

  def filtered_collection
    @collection = Workout.all
    filter_params(params).each do |key, value|
      @collection = @collection.public_send(key, value) if value.present?
    end
    @collection
  end
end
