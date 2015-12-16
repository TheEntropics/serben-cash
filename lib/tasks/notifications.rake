namespace :notification do

  desc 'Send notifications to users'
  task :send => :environment do
    User.all.each do |user|
      Rails.logger.info "Checking #{user.name}"
      if user.missing_months(Date.today.next_month.beginning_of_month).size > 0 && !user.mail.blank? && !user.banned && !user.deleted
        Rails.logger.info "Mail to #{user.name}"
        NotificationMailer.notify(user).deliver_now
      end
    end
  end
end