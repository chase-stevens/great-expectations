class AddSourcesTable < ActiveRecord::Migration[6.1]
  create_table :sources do |t|
    t.text :text
    t.string :url

    t.timestamps
  end
end
