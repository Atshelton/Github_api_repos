require './necessary_stuff'

class GithubRepoClient
  include HTTParty
  base_uri "https://api.github.com"

  def initialize(username)
    @username = username
  end

  def get_users_repolist
    self.class.get("/users/#{@name}/repos")
  end

  def display_repolist
    result = get_users_repolist
    p result[0]
  end
end

client = GithubRepoClient.new("atshelton")
client.display_repolist
