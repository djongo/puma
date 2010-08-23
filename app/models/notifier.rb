class Notifier < ActionMailer::Base
  default_url_options[:host] = "127.0.0.1:3000"
    
  def password_reset_instructions(user)
    subject     "Password Reset Instructions from Puma"
    from        "Puma"
    recipients  user.email
    sent_on     Time.now
    body        :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

end
