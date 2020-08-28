class Api::V1::GamesController < Api::V1::ApiController
  def create
    game = Game.create
    render json: game
  end

  def code
    code = params[:game][:code]
    between = DateTime.now - 1.hour..DateTime + 1.hour
    
    game = Game.where(
      code: code,
      created_at: between,
    ).first

    if game
      render json: game
    else
      render json: { errors: "Game with this code does not exist" }, status: 404
    end

  end

end
