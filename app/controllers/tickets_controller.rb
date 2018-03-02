class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :mentor ]

  def index
    if params[:status]
      @tickets = Ticket.where(status:params[:status])
    elsif
      @tickets = Ticket.where(status:params[status: "open"])
    else
    end
  end

  def show
    @review = @ticket.review
    @mentor_profils = MentorProfil.all
    match_mentors
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.alumni = current_user
    tag = params[:ticket][:ticket_skills]
    tag.shift
    @ticket.tag_names = tag
    @ticket.save
    match_mentors
    redirect_to dashboard_path
  end

  def edit
  end


  def update
    @ticket.update(ticket_params)
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def match_mentors
    @match_mentors_list = MentorProfil.tagged_with(:names => [@ticket.tag_names[0], @ticket.tag_names[1]], :match => :any)
  end

  def mentor
    @ticket.mentor = User.find(params[:mid])
    @ticket.save
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params
      .require(:ticket)
      .permit(
        :content,
        :price,
        :ticket_duration,
        :alumni_id,
        :ticket_location,
        :priority,
        :title,
        :stats,
        ticket_skills: []
      )
  end
end

