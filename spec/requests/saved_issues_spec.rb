require 'rails_helper'

RSpec.describe "SavedIssues", type: :request do
  describe "GET /saved_issues" do
    it "works! (now write some real specs)" do
      get saved_issues_path
      expect(response).to have_http_status(200)
    end
  end
end
