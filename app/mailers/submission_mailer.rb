class SubmissionMailer < ActionMailer::Base
  default from: "festiviteam@gmail.com"

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

  def decline(applicant)
    @applicant = applicant
    mail(to: @applicant.email, subject: "I'm sorry, but you have not been selected for this years show")
  end
end
