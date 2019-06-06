class Batch::GetIssues < Batch::Base

  def self.exec(options = {})
    logger.info 'start.'

    logger.debug '----- dryrun mode -----'

    repo = options.has_key?(:repo) ? options[:repo] : 'rails/rails'
    page = options.has_key?(:page) ? options[:page] : 1
    logger.debug "----- repo: #{repo}, page: #{page} -----"

    unless dryrun?
      client = IssueRequestClient.new
      puts client.issues_csv_strings(repo, per_page: 25, page: page)
    end

    logger.info 'finish.'
  end
end
