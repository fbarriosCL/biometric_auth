class ApplicationJob < ActiveJob::Base
  def perform(email, user_agent, auth)
    ApplicationMailer.send_email(email, user_agent, auth).deliver_now!
  end
end
