ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "trungtoan136@gmail.com",
  :password             => "trung136",
  :authentication       => "plain",
  :enable_starttls_auto => true
}