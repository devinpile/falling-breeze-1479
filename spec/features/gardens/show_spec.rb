require 'rails_helper'

RSpec.describe "Garden Show Page" do
  before :each do
    @garden = Garden.create!(name: "Devin's Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Large", direction: "West")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "East")
    @plot3 = @garden.plots.create!(number: 3, size: "Medium", direction: "North")
    @plant1 = Plant.create!(name: "Euphorus", description: "Blend in tea for anxiety", days_to_harvest: 80)
    @plant2 = Plant.create!(name: "Melatonia", description: "Blend in tea for sleep aid", days_to_harvest: 75)
    @plant3 = Plant.create!(name: "Vibrotus", description: "Blend in tea for energy", days_to_harvest: 60)
    @plant4 = Plant.create!(name: "Sparkosis", description: "Blend in tea for creativity", days_to_harvest: 150)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot3.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot3.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot3.id)
    visit garden_path(@garden.id)
  end

  describe "when i visit a Garden show page" do
    it 'lists unique plants for the garden that take less than 100 days to harvest' do
      expect(page).to have_content(@plant1.name, count: 1)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to_not have_content(@plant4.name)
    end

    xit 'lists order, from most to least, the most appearances by plant in plot and garden' do
      expect(@plant3).to appear_before(@plant4)
      expect(@plant1).to appear_before(@plant2)
    end
  end
end