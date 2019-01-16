# Preview all emails at http://localhost:3000/rails/mailers/standings_update_mailer
class StandingsUpdateMailerPreview < ActionMailer::Preview
  def update_email
    StandingsUpdateMailer.send_update_mailer
  end
end
