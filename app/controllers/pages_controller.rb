class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @ticket = Ticket.new
    #@code = params[:code]
    #github_code(@code)
  end
end
