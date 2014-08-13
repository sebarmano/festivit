class SubmissionMailer < ActionMailer::Base
  default from: "admin@festiv.it"

  def init_apply(applicant)
    @applicant = applicant

    mail(to: @applicant.applicant.email, subject: "#{@applicant.fname}, Thanks for your application!")
  end

  def init_admin(applicant)
    @admin = Admin.first
    @applicant = applicant
    mail(to: @admin.email, subject: "#{@applicant.fname} has submitted an application.")
  end

  def approved(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: "Congratulations! You're application was APPROVED!")
  end
end
