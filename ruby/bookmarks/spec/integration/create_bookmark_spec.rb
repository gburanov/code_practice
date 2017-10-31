require 'rails_helper'

describe "create boomark page", :type => :feature do
  it 'creates the bookmark' do
    visit '/bookmarks/new'
    fill_in "title", :with => "Yandex"
    fill_in "url", :with => "http://ya.ru"
    submit_form

  end

end
