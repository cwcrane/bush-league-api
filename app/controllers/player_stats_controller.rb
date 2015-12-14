class PlayerStatsController < OpenReadController
	before_action :set_player_stat, only: [:update, :destroy]

  # GET /player_stats
  def index
    @player_stats = PlayerStat.all

    render json: @player_stats
  end

  # GET /player_stats/1
  def show
    @player_stat = PlayerStat.find(params[:id])

    render json: @player_stat
  end

  # POST /player_stats
  def create
    @player_stat = PlayerStat.build(player_stat_params)

    if @player_stat.save
      render json: @player_stat, status: :created, player_stat: @player_stat
    else
      render json: @player_stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH /player_stats/1
  def update
    if @player_stat.update(player_stat_params)
      head :no_content
    else
      render json: @player_stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_stats/1
  def destroy
    @player_stat.destroy

    head :no_content
  end

  def set_player_stat
    @player_stat = PlayerStat.find(params[:id])
  end

  def player_stat_params
    params.require(:player_stat).permit(:game, :user, :team, :season, :goals, :assists, :penalty_mins)
  end

  private :set_player_stat, :player_stat_params
end
