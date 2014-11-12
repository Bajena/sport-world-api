class Api::V1::WorkoutsController < Api::V1::BaseController
  def index
    @workouts = PaginatingDecorator.decorate(Workout.paginate(page: page, per_page: per_page))
    render json: @workouts, status: :ok, serializer: PaginatedSerializer
  end

  def show
  end

  def destroy
  end

  def create
  end

  def update
  end
end
