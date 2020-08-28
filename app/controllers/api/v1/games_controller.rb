class Api::V1::GamesController < Api::V1::ApiController
  before_action :set_game, only: [:show]

  def create
    game = Game.create
    Player.create(game: game, user: current_user)

    render json: game, include: 'players.user'
  end

  def show
    render json: @game, include: 'players.user'
  end

  def code
    code = params[:game][:code]
    between = DateTime.now - 1.hour..DateTime + 1.hour
    
    game = Game.where(
      code: code,
      created_at: between,
    ).first

    if game
      render json: game, include: 'players.user'
    else
      render json: { errors: "Game with this code does not exist" }, status: 404
    end

  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

end
