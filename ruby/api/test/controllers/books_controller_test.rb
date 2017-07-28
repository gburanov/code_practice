require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest

  test "index of existing" do
    get "/api/v1/authors/#{authors(:two).id}/books", env: user_env
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal json["total_count"], 2
    assert_equal json["books"].size, 2
  end

  test "index on unexisting" do
    get "/api/v1/authors/654/books", env: user_env
    assert_response :missing
  end

  test "index by not user" do
    get "/api/v1/authors/#{authors(:two).id}/books"
    assert_response :method_not_allowed
  end

  test "show existing" do
    get "/api/v1/books/#{books(:one).id}", env: user_env
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal json["name"], books(:one).name
    assert_equal json["author"], books(:one).author.name
  end

  test "show existing by not user" do
    get "/api/v1/books/#{books(:one).id}"
    assert_response :method_not_allowed
    json = JSON.parse(response.body)
    assert_equal json["errors"][0], "You are not authorized to access this page."
  end

  test "create new entry by user" do
    json = { book: {name: "Mtsiri" } }.to_json
    post "/api/v1/authors/#{authors(:two).id}/books", params: json , headers: json_header, env: user_env
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal json["name"], "Mtsiri"
    assert_equal json["author"], authors(:two).name
  end

  test "create non-valid entry" do
    json = { book: {namo: "Mtsiri" } }.to_json
    post "/api/v1/authors/#{authors(:two).id}/books", params: json , headers: json_header, env: user_env
    assert_response :bad_request
    json = JSON.parse(response.body)
    assert_equal json["type"], "error"
  end

  test "create entry by guest" do
    json = { book: {name: "Mtsiri" } }.to_json
    post "/api/v1/authors/#{authors(:two).id}/books", params: json , headers: json_header, env: guest_env
    assert_response :method_not_allowed
  end

  test "delete not own entry fails" do
    delete "/api/v1/books/#{books(:one).id}", env: user_env
    assert_response :method_not_allowed
  end

  test "delete own entry works" do
    delete "/api/v1/books/#{books(:four).id}", env: user_env
    assert_response :success
  end

  test "admin can remove even not owned" do
    delete "/api/v1/books/#{books(:two).id}", env: admin_env
    assert_response :success
  end

  test "update own entry" do
    json = { book: {name: "Mtsiri" } }.to_json
    patch "/api/v1/books/#{books(:four).id}",params: json , headers: json_header, env: user_env
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal json["name"], "Mtsiri"
  end
end
