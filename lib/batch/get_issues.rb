require 'octokit'

class Batch::GetIssues < Batch::Base

  def self.exec
    logger.info 'start.'

    logger.debug '----- dryrun mode -----'
    unless dryrun?
      puts "Issues"

      client = Octokit::Client.new
      client.auto_paginate = true
      issues = client.issues 'rails/rails'
      puts issues.length
    end

    logger.info 'finish.'
  end
end
