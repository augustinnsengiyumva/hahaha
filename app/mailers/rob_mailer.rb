class RobMailer < ApplicationMailer
  def rob_mail(rob)
   @rob = params[:rob]
   @rob = rob

   mail to: @rob.email, subject: "confirmation e-mail of creating new robs"
  end
end
