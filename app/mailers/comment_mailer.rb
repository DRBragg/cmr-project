class CommentMailer < ApplicationMailer
  def new_comment(comment)
    @comment = comment

    mail(
      to: comment.representative.user.email,
      subject: "New Comment for #{comment.review.name}"
    )
  end
end
