class CommentMailer < ApplicationMailer
  def new_comment(comment)
    @comment = comment

    mail(
      to: comment.review.user.email,
      subject: "New Comment for #{comment.review}"
    )
  end
end
