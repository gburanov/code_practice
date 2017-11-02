# frozen_string_literal: true

require 'rails_helper'

describe Bookmark do
  context 'when ui is invalid' do
    let(:url) { 'bad_http' }
    let(:title) { 'title' }
    it 'does not save' do
      byebug
      bookmark = described_class.new(url: url, title: title)
      expect(bookmark.save).to be false

    end
  end
end
