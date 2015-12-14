class GameController < OpenReadController
	before_action :set_game, only: [:update, :destroy]

  # GET /games
  def index
    @games = Game.all

    render json: @games
  end

  # GET /games/1
  def show
    @game = Game.find(params[:id])

    render json: @game
  end

  # POST /games
  def create
    @game = Games.build(game_params)

    if @game.save
      render json: @game, status: :created, game: @game
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # PATCH /games/1
  def update
    if @game.update(game_params)
      head :no_content
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy

    head :no_content
  end

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:home_team, :away_team, :home_goals, :away_goals, :date, :time, :season)
  end

  private :set_game, :game_params
end
