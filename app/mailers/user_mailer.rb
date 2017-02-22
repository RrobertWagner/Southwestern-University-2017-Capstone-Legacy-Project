class UserMailer < ApplicationMailer
    default from: 'SouthwesternScavengerHunt@gmail.com'
    def reset_password_instructions(user)
        @user = user
        mail(to: @user.email, subject: 'Reset Password')
    end
end
