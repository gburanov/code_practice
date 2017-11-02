# frozen_string_literal: true

require 'rails_helper'

describe Bookmark do
  let(:title) { 'title' }

  context 'when url is invalid' do
    let(:url) { 'bad_http' }
    it 'does not save' do
      bookmark = described_class.new(url: url, title: title)
      expect(bookmark.save).to be false
    end
  end

  context 'when url is valid' do
    let(:url) { 'http://ya.ru' }
    it 'saves' do
      bookmark = described_class.new(url: url, title: title)
      expect(bookmark.save).to be true
    end
  end
end
