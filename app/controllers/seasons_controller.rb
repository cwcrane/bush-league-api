class SeasonsController < OpenReadController
	before_action :set_season, only: [:update, :destroy]

  # GET /seasons
  def index
    @seasons = Season.all

    render json: @seasons
  end

  # GET /seasons/1
  def show
    @season = Season.find(params[:id])

    render json: @season
  end

  # POST /seasons
  def create
    @season = current_user.seasons.build(season_params)

    if @season.save
      render json: @season, status: :created, season: @season
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH /seasons/1
  def update
    if @season.update(season_params)
      head :no_content
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seasons/1
  def destroy
    @season.destroy

    head :no_content
  end

  def set_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:team, :league, :start_date, :end_date)
  end

  private :set_season, :season_params
end
