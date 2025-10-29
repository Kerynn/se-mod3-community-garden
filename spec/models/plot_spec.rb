require "rails_helper"

RSpec.describe Plot, type: :model do
  describe "relationships" do
    it { should belong_to :garden }
    it { should have_many :plot_plants }
    it { should have_many(:plants).through(:plot_plants) }
  end

  describe "plant_list" do
    it "returns the names of the plants in the plot" do
      garden = Garden.create!(name: "Frank Garden", organic: true)
      plot = garden.plots.create!(size: "small", direction: "West")
      rose = plot.plants.create!(name: "rose", description: "red and lovely", days_to_harvest: 8)
      lily = plot.plants.create!(name: "lily", description: "yellow maybe", days_to_harvest: 10)
      basil = plot.plants.create!(name: "basil", description: "tasty and smells great", days_to_harvest: 5)
      
      expect(plot.plant_list).to eq([rose.name, lily.name, basil.name])
    end
  end
end