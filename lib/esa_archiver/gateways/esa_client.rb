# frozen_string_literal: true

require 'dotenv/load'
require 'esa'
require 'logger'

module EsaArchiver
  module Gateways
    class EsaClient
      def initialize(driver)
        @driver = driver
      end

      def find_expired_posts(category, date)
        response = driver.posts(q: "category:#{category} kind:flow -in:Archived created:<#{date}", per_page: 75)
        to_posts(response.body)
      end

      def update_post(post, user)
        response = driver.update_post(
          post.number, category: post.category, message: message, updated_by: user
        )

        # archive post as esa_bot if post creator is not in your team
        if no_error?(response)
          to_post(response.body)
        else
          logger.info "Post No.#{post.number} has error received #{response.body}"
          logger.info 'Retry archiving post as esa_bot'
          update_post(post, 'esa_bot')
        end
      end

      private

      attr_reader :driver

      def message
        ENV['ESA_ARCHIVE_MESSAGE']
      end

      def logger
        @logger ||= Logger.new($stdout)
      end

      def no_error?(response)
        response.body['error'].nil?
      end

      def to_posts(body)
        body['posts'].map { |raw| to_post(raw) }
      end

      def to_post(raw)
        Entities::EsaPost.new(
          raw['number'],
          raw['category'],
          raw['message'],
          raw['created_by']['screen_name']
        )
      end
    end
  end
end
