class RostersController < OpenReadController
	before_action :set_roster, only: [:update, :destroy]

  # GET /rosters
  def index
    @rosters = Roster.all

    render json: @rosters
  end

  # GET /rosters/1
  def show
    @roster = Roster.find(params[:id])

    render json: @roster
  end

  # POST /rosters
  def create
    @roster = current_user.rosters.build(roster_params)

    if @roster.save
      render json: @roster, status: :created, roster: @roster
    else
      render json: @roster.errors, status: :unprocessable_entity
    end
  end

  # PATCH /rosters/1
  def update
    if @roster.update(roster_params)
      head :no_content
    else
      render json: @roster.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rosters/1
  def destroy
    @roster.destroy

    head :no_content
  end

  def set_roster
    @roster = current_user.rosters.find(params[:id])
  end

  def roster_params
    params.require(:roster).permit(:team, :user)
  end

  private :set_roster, :roster_params
end