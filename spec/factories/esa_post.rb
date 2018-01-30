# frozen_string_literal: true

FactoryBot.define do
  factory :esa_post, class: EsaArchiver::Entities::EsaPost do
    sequence :number
    category { 'path/to/post' }
  end
end
