require 'rails_helper'

RSpec.describe "Plot Index Page" do
  before do
    @garden = Garden.create!(name: "Devin's Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Large", direction: "West")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "East")
    @plant1 = Plant.create!(name: "Euphorus", description: "Blend in tea for anxiety", days_to_harvest: 80)
    @plant2 = Plant.create!(name: "Melatonia", description: "Blend in tea for sleep aid", days_to_harvest: 75)
    @plant3 = Plant.create!(name: "Vibrotus", description: "Blend in tea for energy", days_to_harvest: 60)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    visit plots_path
  end

  describe "when I visit a Plot index page" do
    it "lists all plot numbers and the names of all that plots plants" do
      within "#plot-#{@plot1.id}" do
        expect(page).to have_content(@plot1.number)
        expect(page).to have_content(@plant1.name)
        expect(page).to have_content(@plant2.name)
        expect(page).to have_content(@plant3.name)
      end

      within "#plot-#{@plot2.id}" do
        expect(page).to have_content(@plot2.number)
        expect(page).to_not have_content(@plant1.name)
        expect(page).to_not have_content(@plant2.name)
        expect(page).to have_content(@plant3.name)
      end
    end 
  end
end