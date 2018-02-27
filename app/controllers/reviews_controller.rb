class ReviewsController < ApplicationController
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.ticket = Ticket.find(params[:ticket_id])
    @review.mentor_profil = Mentor_profil.find(@review.ticket.mentor_id)
    if @review.save
      redirect_to dashboard_path()
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
