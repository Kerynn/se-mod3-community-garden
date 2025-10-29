class CreatePlotPlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plot_plants do |t|
      t.references :plot, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
