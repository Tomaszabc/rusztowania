namespace :orders do
  desc "Update orders older than a week to completed unless they have missing parts"
  task update_status: :environment do
    Order.where("created_at < ?", 1.week.ago).where.not(status: :missing_parts).update_all(status: :completed)
  end
end
