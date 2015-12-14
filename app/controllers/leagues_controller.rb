#
class LeaguesController < OpenReadController
  before_action :set_league, only: [:update, :destroy]

  # GET /leagues
  def index
    @leagues = League.all

    render json: @leagues
  end

  # GET /leagues/1
  def show
    @league = League.find(params[:id])

    render json: @league
  end

  # POST /leagues
  def create
    @league = League.build(league_params)

    if @league.save
      render json: @league, status: :created, league: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # PATCH /leagues/1
  def update
    if @league.update(league_params)
      head :no_content
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  def destroy
    @league.destroy

    head :no_content
  end

  def set_league
    @league = league.find(params[:id])
  end

  def league_params
    params.require(:league).permit(:name, :user, :location, :date_created)
  end

  private :set_league, :league_params
end
