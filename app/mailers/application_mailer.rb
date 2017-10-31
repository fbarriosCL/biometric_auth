class ApplicationMailer < ActionMailer::Base
  def send_email(email, user_agent, auth)
    @auth       = auth
    @user_agent = user_agent
    mail(from: '"Biometric Auth" <avisos@backtrackacademy.com>', to: email, subject: 'Biometric Auth')
  end
end
