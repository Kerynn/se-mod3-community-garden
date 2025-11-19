class AddNumSeedlingsToPlotPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plot_plants, :num_seedlings, :integer
  end
end
