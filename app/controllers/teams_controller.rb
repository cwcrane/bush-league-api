class TeamsController < OpenReadController
#before_action :set_book, only: [:update, :destroy]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
    @team = Team.find(params[:id])

    render json: @team
  end

  # POST /teams
  def create
    @team = current_user.teams.build(team_params)

    if @team.save
      render json: @team, status: :created, team: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # PATCH /teams/1
  def update
    if @team.update(team_params)
      head :no_content
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy

    head :no_content
  end

  def set_team
    @team = Team.find(params[:id]) #removed current_user. so that this wil work for unauthorized requests.
  end

  def team_params
    params.require(:team).permit(:name, :date_created, :user_id)
  end

  private :set_team, :team_params
end
