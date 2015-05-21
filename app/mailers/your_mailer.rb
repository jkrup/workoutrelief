class YourMailer < ActionMailer::Base
  def confirmation_email (to_email, code)
    @code = code
    mail :subject => "Welcome to WorkOut Relief",
         :to      => to_email,
         :from    => "no-reply@workoutrelief.info"
  end
end
