class RobMailer < ApplicationMailer
  def rob_mail(rob)
   @rob = rob

   mail to: @rob.user.email, subject: "confirmation e-mail of creating new robs"
  end
end
