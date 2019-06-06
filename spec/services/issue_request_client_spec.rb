require 'rails_helper'
require 'webmock/rspec'
require 'octokit'

describe IssueRequestClient, type: :service do
  before do
    WebMock.enable!
  end

  describe "get issues csv strings" do
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

    describe "get" do
      before do
        client = IssueRequestClient.new
        @res = client.issues_csv_strings 'rails/rails'
      end

      it "res.count === 30" do
        expect(@res.count).to eq 30
      end
      it "validate fields" do
        @res.each do |csv_string|
         title, body, html_url = csv_string.split('","').map {|field| field.gsub(/^\"|\"$/, "") }
         expect(title.length).to be <= 30
         expect(body.length) .to be <= 50
         expect(html_url)    .to match(/^http(s)?:\/\/github.com\/rails\/rails\/(issues|pull)\/\d+/)
        end
      end

    end
  end
end
