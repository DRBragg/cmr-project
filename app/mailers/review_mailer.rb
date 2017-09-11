class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.representative.user.email,
      subject: "New Review for #{review.representative.name}"
    )
  end
end
