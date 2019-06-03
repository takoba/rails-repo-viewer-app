class Batch::GetIssues < Batch::Base

  def self.exec
    logger.info 'start.'

    logger.debug '----- dryrun mode -----'
    unless dryrun?
      puts "Issues"
    end

    logger.info 'finish.'
  end
end
