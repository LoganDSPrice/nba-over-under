# Preview all emails at http://localhost:3000/rails/mailers/nba_mailer
class NbaMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    NbaMailer.sample_email(Contestant.last)
  end
end
