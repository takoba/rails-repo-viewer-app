require "rails_helper"

RSpec.describe SavedIssuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/saved_issues").to route_to("saved_issues#index")
    end

    it "routes to #new" do
      expect(:get => "/saved_issues/new").to route_to("saved_issues#new")
    end

    it "routes to #show" do
      expect(:get => "/saved_issues/1").to route_to("saved_issues#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/saved_issues/1/edit").to route_to("saved_issues#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/saved_issues").to route_to("saved_issues#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/saved_issues/1").to route_to("saved_issues#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/saved_issues/1").to route_to("saved_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/saved_issues/1").to route_to("saved_issues#destroy", :id => "1")
    end
  end
end
