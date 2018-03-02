class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :github_params, only: :github_code

  def home
    @ticket = Ticket.new
    #@code = params[:code]
    #github_code(@code)
  end

end
