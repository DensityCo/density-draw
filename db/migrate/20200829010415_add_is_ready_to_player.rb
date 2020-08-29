class AddIsReadyToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :is_ready, :boolean
  end
end
