class ReviewsController < ApplicationController
  before_action :set_ticket, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.ticket = @ticket
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

  def set_ticket
    @ticket = ticket.find(params[:ticket_id])
  end
end
