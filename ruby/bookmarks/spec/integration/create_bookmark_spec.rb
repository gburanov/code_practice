require 'rails_helper'

describe "create boomark page", :type => :feature do
  it 'creates the bookmark' do
    expect(Bookmark.count).to be 0
    visit '/bookmarks/new'
    fill_in "title", :with => "Yandex"
    fill_in "url", :with => "http://ya.ru"
    submit_form
    expect(Bookmark.count).to be 1
    expect(page.current_path).to eq "/bookmarks/1"
  end

end
