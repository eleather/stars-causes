ActionMailer::Base.default_content_type = 'text/html'

class Mailer < ActionMailer::Base
  FROM = "noreply@#{ENV['APP_HOST']}"
  helper :application
  
  def star(star)
    subject "#{star.to_sentence} got a star!"
    recipients User.active.map(&:email)
    from FROM
    body :star => star
  end

  def comment(comment)
    star = comment.star
    subject "#{star.to_sentence} got a star!"
    recipients (star.to - [comment.author]).map(&:email)
    from FROM
    body :comment => comment
  end

  def report
    superstars = Superstar.last_week
    num_stars = superstars.map(&:num_stars).sum
    num_tos   = superstars.map{|s| s.stars.map(&:to_id  )}.flatten.uniq.size
    num_froms = superstars.map{|s| s.stars.map(&:from_id)}.flatten.uniq.size

    subject "Superstars - #{Date.today.beginning_of_week.strftime('%B %d, %Y')}"
    recipients User.active.map(&:email)
    from FROM

    body :superstars => Superstar.last_week,
         :num_stars => num_stars, :num_tos => num_tos,
         :num_froms => num_froms
  end
end
