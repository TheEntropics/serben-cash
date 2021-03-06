class PaymentHelper
  def self.cost_per_person
    num_users = User.count(deleted: false)
    return 0 if num_users == 0

    cost_per_month = APP_CONFIG['cost_per_month']
    cost = (cost_per_month.to_f / num_users).round(1)

    [cost, 1.0].max
  end
end
