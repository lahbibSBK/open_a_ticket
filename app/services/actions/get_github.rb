class GetGithub

  def initialize(username)
    @username = username
  end

  def fetch_github_photo
    "https://kitt.lewagon.com/placeholder/users/#{@username}"
  end

end
