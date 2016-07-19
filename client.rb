require './necessary_stuff'

class GithubRepoClient
  include HTTParty
  base_uri "https://api.github.com"

  def initialize(username)
    @username = username
  end

  def get_users_repolist
    self.class.get("/users/#{@username}/repos", headers: {
      "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
      "User-Agent" => "atshelton"
      })

  end

  def display_repolist
    result = get_users_repolist
    result.each
  end
end
