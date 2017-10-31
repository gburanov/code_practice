require 'rails_helper'

describe BookmarksController do
  context '#index' do
  end

  context '#new' do
    let (:good_payload) { { bookmark: {url: 'http://ya.ru', text: 'Yandex'} } }
  end
end
