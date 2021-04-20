# frozen_string_literal: true

require 'esa_archiver'
require 'logger'

class Posts < Thor
  desc 'archive', 'archive posts specified monthes ago'

  def archive
    logger = Logger.new($stdout)
    logger.info('archive task start')
    begin
      logger.info(EsaArchiver.archive)
    rescue StandardError => e
      logger.error(e)
    end
    logger.info('archive task finished')
  end
end
