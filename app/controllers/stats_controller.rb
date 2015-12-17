class StatsController < OpenReadController
	before_action :set_stat, only: [:update, :destroy]

  # GET /stats
  def index
    @stats = Stat.all

    render json: @stats
  end

  # GET /stats/1
  def show
    @stat = Stat.find(params[:id])

    render json: @stat
  end

  # POST /stats
  def create
    @stat = Stat.create(stat_params)

    if @stat.save
      render json: @stat, status: :created, stat: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH /stats/1
  def update
    if @stat.update(stat_params)
      head :no_content
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stats/1
  def destroy
    @stat.destroy

    head :no_content
  end

  def set_stat
    @stat = Stat.find(params[:id])
  end

  def stat_params
    params.require(:stat).permit(:game_id, :user_id, :team_id, :season_id, :goals, :assists, :penalty_mins)
  end

  private :set_stat, :stat_params
end
