class UserMailer < ActionMailer::Base
  default :from => 'noreply-notesvine@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    attachments.inline['photo.png'] = File.read(File.join(Rails.root, 'app', 'assets', 'images','email_bg.jpg'))
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end