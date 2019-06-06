require 'octokit'

class IssueRequestClient

  def initialize
    @client = Octokit::Client.new
  end

  def issues_csv_strings(repo, options = {})
    issues = @client.issues(repo, options)
    
    generator = CSVGenerator.new
    generator.issues_to_csv_strings issues
  end
end
