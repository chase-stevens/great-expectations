class AddPairingTable < ActiveRecord::Migration[6.1]
  create_table :pairings do |t|
    t.string :phrase
    t.integer :count
    t.integer :chapter
  end
end
