# frozen_string_literal: true

FactoryBot.define do
  factory :esa_post, class: EsaArchiver::Entities::EsaPost do
    sequence :number
    category { 'path/to/post' }
    message 'esa_archiver[skip notice]'
    created_by 'user1'
  end
end
