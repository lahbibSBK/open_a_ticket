class ReviewsController < ApplicationController
  before_action :set_ticket, only: [:new, :create]

  def new
    @review = Review.new
    @review.ticket = @ticket
    @review.ticket.status = "closed"
    authorize @review
    #le redirect pose problème avec pundit
    #redirect_to mentor_profil_path(@review.ticket.mentor.mentor_profil)
  end

  def create
     @review = Review.new(review_params)
     @review.ticket = @ticket
     authorize @review
    if @review.save
      redirect_to mentor_profil_path(@review.ticket.mentor)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
