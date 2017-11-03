# frozen_string_literal: true

require 'rails_helper'

describe 'show boomark page', type: :feature do
  context 'when bookmarks already exist' do
    before do
      Bookmark.create(shortening: 'ya', title: 'yandex', url: 'http://ya.ru')
      Bookmark.create(title: 'cats', url: 'http://ya.ru/cats')
      Bookmark.create(shortening: 'dogs', title: 'grrr', url: 'http://ya.ru/dogs')
      Bookmark.create(title: 'cats', url: 'http://ya.ru/other_cats')
    end

    it 'shows them in index' do
      visit '/'
      expect(page).to have_content('yandex')
      expect(page).to have_content('http://ya.ru/cats')
      expect(page).to have_content('http://ya.ru/dogs')
      expect(page).to have_content('http://ya.ru/other_cats')
    end
  end
end
