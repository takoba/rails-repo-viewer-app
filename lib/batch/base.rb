require 'logger'

# cf.) https://qiita.com/kei500/items/4014c8c8455b97d6451f
class Batch::Base
  @@is_dryrun = false

  class << self
    def logger
      @@logger ||= Logger.new(
        dryrun? ? STDOUT : File.join(Rails.root, 'log', "#{self.to_s.underscore}")
      )
    end

    def dryrun(*args)
      @@is_dryrun = true
      logger.level = Logger::DEBUG
      exec(*args)
    end

    def dryrun?
      @@is_dryrun
    end
  end

end
