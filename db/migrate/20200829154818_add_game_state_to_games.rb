class AddGameStateToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :game_state, :string
  end
end
