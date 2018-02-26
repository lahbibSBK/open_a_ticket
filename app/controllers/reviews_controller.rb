class ReviewsController < ApplicationController
  def new
    @ticket = ticket.find(params[:ticket_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.ticket = ticket.find(params[:ticket_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
