class RepresentativeMailer < ApplicationMailer
  def new_representative(representative)
    @representative = representative

    mail(
      to: representative.user.email,
      subject: "New Representative for #{representative.name}"
    )
  end
end
