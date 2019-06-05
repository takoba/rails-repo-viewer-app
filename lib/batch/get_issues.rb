require 'octokit'

class Batch::GetIssues < Batch::Base

  def self.exec(options = {})
    logger.info 'start.'

    logger.debug '----- dryrun mode -----'

    repo = options.has_key?(:repo) ? options[:repo] : 'rails/rails'
    page = options.has_key?(:page) ? options[:page] : 1
    logger.debug "----- repo: #{repo}, page: #{page} -----"

    unless dryrun?
      client = Octokit::Client.new
      issues = client.issues(repo, per_page: 25, page: page)

      generator = CSVGenerator.new
      puts generator.issues_to_csv_strings issues
    end

    logger.info 'finish.'
  end
end
