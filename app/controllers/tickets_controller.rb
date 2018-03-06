class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :mentor, :close ]

  def index
    @tickets = policy_scope(Ticket)
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
    authorize @ticket
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.alumni = current_user
    @ticket.status = "open"
    authorize @ticket

    if @ticket.save
      @ticket.mentor_recommanded_list = match_mentors
      redirect_to dashboard_path, notice: 'Your ticket has been successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      authorize @ticket
      redirect_to ticket_path(@ticket), notice: 'Your ticket has been successfully created.'
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path, notice: 'Sniff, Sniff!! Ticket was successfully destroyed.'
  end

  def mentor
    @ticket.mentor = MentorProfil.find(params[:mid]).user
    @ticket.status = "pending"
    authorize @ticket
    @ticket.save
  end

  def close
    @ticket.status = "closed"
    authorize @ticket
    if @ticket.save
      redirect_to ticket_path(@ticket), notice: 'Your Ticket has been successfully closed.'
    else
    end
  end

  def cancel
    @ticket.status = "cancelled"
    authorize @ticket
    @ticket.save
  end
  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
    authorize @ticket
  end

  def ticket_params
    params
      .require(:ticket)
      .permit(
        :content,
        :price_cents,
        :ticket_duration,
        :alumni_id,
        :ticket_location,
        :priority,
        :speaking_language,
        :title,
        :stats,
        :status,
        tag_names: []
      )
  end

  def match_mentors
    match_mentors = []
    @match_mentors_list = []
    match_mentors = MentorProfil.tagged_with(
      names: @ticket.tag_names,
      match: :any
    )

    match_mentors.each do |mentor|
      if mentor.minimum_price.to_i <= @ticket.price_cents.to_i
        @match_mentors_list << mentor
      end
    end
  end
end
