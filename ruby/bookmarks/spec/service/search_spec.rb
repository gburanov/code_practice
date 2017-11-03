# frozen_string_literal: true

require 'rails_helper'

describe Searcher do
  let(:subject) { described_class.new(search).call }

  before do
    Bookmark.create(shortening: 'ya', title: 'yandex', url: 'http://ya,ru')
    Bookmark.create(title: 'cats', url: 'http://ya,ru/cats')
    Bookmark.create(title: 'dogs', url: 'http://ya,ru/dogs')
  end

  context 'when looking yandex' do
    let(:search) { 'http://ya,ru' }

    it 'shows 3 results' do
      expect(subject.count).to eq 3
    end
  end

  context 'when looking for cats' do
    let(:search) { 'cats' }

    it 'shows 1 results' do
      expect(subject.count).to eq 1
    end
  end
end
