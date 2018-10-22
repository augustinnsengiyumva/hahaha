class RobMailer < ApplicationMailer
  def rob_mail(rob)
   @rob = rob

   mail to: @robs.user.email, subject: "confirmation e-mail of creating new robs"
  end
end
