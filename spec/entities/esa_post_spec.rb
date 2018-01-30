# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EsaArchiver::Entities::EsaPost do
  describe '#archived_category' do
    let(:post) { build(:esa_post, category: category) }
    subject { post.archived_category }

    context 'not contain category' do
      let(:category) { nil }
      it { expect(subject).to eq('Archived/') }
    end

    context 'contain category' do
      let(:category) { 'path/to/post' }
      it { expect(subject).to eq('Archived/path/to/post') }
    end
  end
end
