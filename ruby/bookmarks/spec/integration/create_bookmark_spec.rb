# frozen_string_literal: true

require 'rails_helper'

describe 'create boomark page', type: :feature do
  it 'creates the bookmark' do
    expect(Bookmark.count).to be 0
    visit '/bookmarks/new'
    fill_in 'bookmark[title]', with: 'Yandex'
    fill_in 'bookmark[url]', with: 'http://ya.ru'
    submit_form
    expect(Bookmark.count).to be 1
    expect(page.current_path).to eq '/bookmarks/1'
  end

  it 'creates with all the 3 fields' do
    expect(Bookmark.count).to be 0
    visit '/bookmarks/new'
    fill_in 'bookmark[title]', with: 'Yandex'
    fill_in 'bookmark[url]', with: 'http://ya.ru'
    fill_in 'bookmark[shortening]', with: 'ya'
    submit_form
    expect(Bookmark.count).to be 1
    expect(Site.count).to be 1
    expect(Bookmark.last.title).to eq 'Yandex'
    expect(Bookmark.last.url).to eq 'http://ya.ru'
    expect(Bookmark.last.shortening).to eq 'ya'
    expect(page.current_path).to eq '/bookmarks/1'
  end

  context 'when something is not filled' do
    it 'shows error' do
      visit '/bookmarks/new'
      fill_in 'bookmark[title]', with: 'Yandex'
      submit_form
      expect(Bookmark.count).to be 0
      expect(page).to have_content("Url can't be blank")
    end
  end
end
