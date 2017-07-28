require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest

  test "index by user" do
    get "/api/v1/authors", env: user_env
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal json["total_count"], 2
    assert_equal json["authors"].size, 2
  end

  test "index by not user" do
    get "/api/v1/authors"
    assert_response :method_not_allowed
    json = JSON.parse(response.body)
    assert_equal json["errors"][0], "You are not authorized to access this page."
  end

  test "show existing" do
    get "/api/v1/authors/#{authors(:one).id}", env: user_env
    assert_response :success

    json = JSON.parse(response.body)
    assert_equal json["name"], authors(:one).name
    assert_equal json["biography"], authors(:one).biography
  end

  test "show existing by not user" do
    get "/api/v1/authors/#{authors(:one).id}"
    assert_response :method_not_allowed
    json = JSON.parse(response.body)
    assert_equal json["errors"][0], "You are not authorized to access this page."
  end

  test "show unexisting" do
    get "/api/v1/authors/666", env: user_env
    assert_response :missing
    json = JSON.parse(response.body)
    assert_equal json["type"], "error"
  end

  test "create new entry by user" do
    json = { author: {name: "Esenin", biography: "Playboy"} }.to_json
    post "/api/v1/authors.json", params: json , headers: json_header, env: user_env
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal json["name"], "Esenin"
    assert_equal json["biography"], "Playboy"
  end

  test "try to create entry without name" do
    json = { author: {biography: "Playboy"} }.to_json
    post "/api/v1/authors.json", params: json , headers: json_header, env: user_env
    assert_response :bad_request
    json = JSON.parse(response.body)
    assert_equal json["type"], "error"
  end

  test "create new entry by guest" do
    json = { author: {name: "Esenin", biography: "Playboy"} }.to_json
    post "/api/v1/authors.json", params: json , headers: json_header, env: guest_env
    assert_response :method_not_allowed
  end

  test "delete not own entry fails" do
    delete "/api/v1/authors/#{authors(:two).id}", env: user_env
    assert_response :method_not_allowed
  end

  test "delete own entry works" do
    delete "/api/v1/authors/#{authors(:one).id}", env: user_env
    assert_response :success
  end

  test "admin can remove even not owned" do
    delete "/api/v1/authors/#{authors(:two).id}", env: admin_env
    assert_response :success
  end

  test "update own entry" do
    json = { author: {biography: "Changed bio"} }.to_json
    patch "/api/v1/authors/#{authors(:one).id}",params: json , headers: json_header, env: user_env
    assert_response :success
    json = JSON.parse(response.body)
    assert_equal json["biography"], "Changed bio"
  end
end
