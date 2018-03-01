class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy ]

  def index
    @tickets = Ticket.all
  end

  def show
    @review = @ticket.review
    @mentor_profils = MentorProfil.all

  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.alumni = current_user
    @ticket.save
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

