# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EsaArchiver::Gateways::EsaClient do
  let(:driver) { double('driver') }
  let(:target) { described_class.new(driver) }

  describe '#find_expired_posts' do
    let(:post) { build(:esa_post) }
    let(:body) do
      { 'posts' => [
        'number' => post.number,
        'category' => post.category
      ] }
    end
    let(:response) { double('response', body: body) }

    subject { target.find_expired_posts('path/to/post', '2018-01') }

    it 'return posts' do
      allow(driver).to receive(:posts).with(q: 'category:path/to/post kind:flow -in:Archived updated:<2018-01')
                                      .and_return(response)
      expect(subject).to eq([post])
    end
  end

  describe '#update_post' do
    let(:post) { build(:esa_post) }
    let(:body) do
      { 'number' => post.number,
        'category' => post.category }
    end
    let(:response) { double('response', body: body) }

    subject { target.update_post(post, 'bot_user') }

    it 'return updated post' do
      allow(driver).to receive(:update_post)
        .with(post.number, category: post.category, updated_by: 'bot_user')
        .and_return(response)
      expect(subject).to eq(post)
    end
  end
end
