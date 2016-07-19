require "./necessary_stuff"

class GithubRepoFinder < Sinatra::Base

  get '/' do

    ERB.new(File.read("./welcome.html.erb")).result(binding)
  end

  get "/cssfile.css" do
    File.read("/github.css")
  end

  post "/repos" do
    username = params["username"]
    repolist = GithubRepoClient.new(username).display_repolist

    ERB.new(File.read("./repos.html.erb")).result(binding)

  end

  run! if app_file == $PROGRAM_NAME
end
