class NewUserMailer < ApplicationMailer
  def new_user(user)
    @user = current_user

    mail(
      to: user.email,
      subject: "Welcome #{user.name}!"
    )
  end
end
