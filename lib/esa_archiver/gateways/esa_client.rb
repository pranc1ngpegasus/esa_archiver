# frozen_string_literal: true

require 'esa'

module EsaArchiver
  module Gateways
    class EsaClient
      def initialize(driver)
        @driver = driver
      end

      def find_expired_posts(category, date)
        response = driver.posts(q: "category:#{category} kind:flow -in:Archived updated:<#{date}")
        to_posts(response.body)
      end

      def update_post(post, user)
        response = driver.update_post(
          post.number, category: post.category, updated_by: user
        )
        to_post(response.body)
      end

      private

      attr_reader :driver

      def to_posts(body)
        body['posts'].map { |raw| to_post(raw) }
      end

      def to_post(raw)
        Entities::EsaPost.new(
          raw['number'],
          raw['category']
        )
      end
    end
  end
end
