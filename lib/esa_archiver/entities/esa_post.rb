# frozen_string_literal: true

module EsaArchiver
  module Entities
    EsaPost = Struct.new(:number, :category) do
      def archived_category
        "Archived/#{category}"
      end
    end
  end
end
