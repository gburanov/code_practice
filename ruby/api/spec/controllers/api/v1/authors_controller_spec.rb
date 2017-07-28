require "rails_helper"

def env_for(user)
  env = Hash.new
  env["CONTENT_TYPE"] = "application/json"
  env["ACCEPT"] = "application/json"
  env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{user.login}:#{user.password}")
  env
end

describe Api::V1::AuthorsController, type: :request do
  describe "#index" do
    let (:url) { "/api/v1/authors" }
    let (:user) { FactoryGirl.build(:user) }

    it "is 200 for user" do
      get url, env: env_for(user)
      expect(response.status).to eq 200
            puts json_response.to_s
      expect(json_response["total_count"]).to eq 2
      expect(json_response["authors"].size).to eq 2
    end

    it "is not allowed by not authorized" do
      get url
      expect(response.status).to eq 405
      expect(json_response["errors"][0]).to eq "You are not authorized to access this page."
    end
  end

end
