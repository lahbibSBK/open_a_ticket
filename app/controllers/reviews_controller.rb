class ReviewsController < ApplicationController
  before_action :set_ticket, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
     @review = Review.new(review_params)
     @review.ticket = @ticket
    if @review.save
      redirect_to mentor_profil_path(@ticket)
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
