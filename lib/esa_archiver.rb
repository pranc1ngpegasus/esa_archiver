# frozen_string_literal: true

require 'dotenv/load'
require 'date'

require 'esa_archiver/version'
require 'esa_archiver/entities/esa_post'
require 'esa_archiver/gateways/esa_client'
require 'esa_archiver/use_cases/archive'

module EsaArchiver
  class << self
    def archive
      UseCases::Archive.new(esa_client).call(ENV['ESA_ARCHIVE_CATEGORY'], ENV['ESA_ARCHIVE_ELAPSED_DAYS'])
    end

    private

    def esa_client
      driver = Esa::Client.new(
        access_token: ENV['ESA_OWNER_API_TOKEN'],
        current_team: ENV['ESA_TEAM']
      )
      @esa_client ||= Gateways::EsaClient.new(driver)
    end
  end
end
