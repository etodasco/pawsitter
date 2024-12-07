class ReviewsController < ApplicationController
  before_action :set_pet_sitter, only: [:create]  # Find pet sitter to associate with review

  def create
    @review = @pet_sitter.reviews.new(review_params)
    @review.reviewer = current_user  # The current user is the reviewer

    if @review.save
      # Recalculate the average rating
      raise
      @average_rating = (Review.group(:rating).sum).fdiv(Review.group(:rating).count)
      @pet_sitter.update(average_rating: @pet_sitter.average_rating)

      redirect_to user_profile_path(@pet_sitter), notice: "Review submitted successfully!"
    else
      redirect_to user_profile_path(@pet_sitter), alert: "There was an issue submitting your review."
    end
  end

  private

  # Find pet sitter by ID (this assumes the pet sitter profile page has an 'id' parameter)
  def set_pet_sitter
    @pet_sitter = User.find(params[:user_id])  # Change `User` to the actual model if it's not `User`
  end

  # Permit review parameters (rating and content)
  def review_params
    params.require(:review).permit(:rating, :content, :user_id)
  end
end
