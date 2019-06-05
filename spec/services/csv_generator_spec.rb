require 'rails_helper'
require 'webmock/rspec'
require 'octokit'

describe CSVGenerator, type: :service do
  before do
    WebMock.enable!
  end

  describe "generate issues to csv" do
    before do
      @generator = CSVGenerator.new

      body = ->(filepath) {
        File.read(filepath)
      }
      WebMock.stub_request(:get, "https://api.github.com/repos/rails/rails/issues").to_return(
        body: body.call("#{Rails.root}/test/fixtures/files/stub_github_api_issues_rails_rails.json"),
        status: 200,
        headers: { 'Content-Type' => 'application/json' }
      )
    end

    describe "generate csv from issues api response" do
      before do
        client = Octokit::Client.new
        @issues = issues = client.issues "rails/rails"
        @res = @generator.issues_to_csv_strings issues
      end

      it "res.count = issues.length" do
        expect(@res.count).to eq @issues.length
      end
    end
  end
end
