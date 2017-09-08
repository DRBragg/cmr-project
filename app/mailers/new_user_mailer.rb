class NewUserMailer < ApplicationMailer
  def new_user(user)
    @user = user

    mail(
      to: user.email,
      subject: "Welcome #{user.name}!"
    )
  end
end
