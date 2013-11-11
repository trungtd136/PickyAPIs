class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def registration_confirmation(profile)
    @profile = profile
    # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    # mail(:to => "#{profile.name} <#{profile.email}>", :subject => "Registered")

    p "-------------------"
    p "to email: " + @profile.email
    p "-------------------"
    mail(:to => @profile.email, :subject => "Registered")
  end
end
