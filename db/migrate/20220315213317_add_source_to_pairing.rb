class AddSourceToPairing < ActiveRecord::Migration[6.1]
  def change
    add_column :pairings, :source, :string
  end
end
