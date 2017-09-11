class RepresentativeMailer < ApplicationMailer
  def new_representative(representative)
    @representative = representative

    mail(
      to: representative.user.email,
      subject: "Representative Confirmed"
    )
  end
end
