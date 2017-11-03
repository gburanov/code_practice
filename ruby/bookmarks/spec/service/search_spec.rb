# frozen_string_literal: true

require 'rails_helper'

describe Searcher do
  let(:subject) { described_class.new(search).call }

  before do
    Bookmark.create(shortening: 'ya', title: 'yandex', url: 'http://ya.ru')
    Bookmark.create(title: 'cats', url: 'http://ya.ru/cats')
    Bookmark.create(shortening: 'dogs', title: 'grrr', url: 'http://ya.ru/dogs')
    Bookmark.create(title: 'cats', url: 'http://ya.ru/other_cats')
  end

  context 'when looking yandex' do
    let(:search) { 'ya.ru' }

    it 'shows 4 results' do
      expect(subject.count).to eq 4
    end
  end

  context 'when looking for cats' do
    let(:search) { 'cats' }

    it 'shows 2 results' do
      expect(subject.count).to eq 2
    end
  end

  context 'when looking for dogs' do
    let(:search) { 'dogs' }

    it 'shows 1 results' do
      expect(subject.count).to eq 1
    end
  end

  context 'when looking for exact url' do
    let(:search) { 'http://ya.ru/dogs' }

    it 'shows 1 results' do
      expect(subject.count).to eq 1
    end
  end

  context 'when looking for smth that does not exist' do
    let(:search) { 'wired_stuff' }

    it 'shows 0 results' do
      expect(subject.count).to eq 0
    end
  end
end
