class SubmissionMailer < ActionMailer::Base
  default from: "admin@festiv.it"

  def init_apply(applicant)
    @applicant = applicant
    @admin = Admin.first
    mail(to: @applicant.email, subject: "#{@applicant.first_name}, Thanks for your application!")

  end

  def init_admin(applicant)
    @admin = Admin.first
    @applicant = applicant
    mail(to: @admin.email, subject: "#{@applicant.first_name} has submitted an application.")
  end
end
