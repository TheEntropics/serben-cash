module ApplicationHelper
  def true_mark
    check_box_tag nil, 1, true, disabled: true
  end
  def false_mark
    check_box_tag nil, 0, false, disabled: true
  end

  def boolean_mark(status)
    status ? true_mark : false_mark
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def format_currency(amount)
    number_to_currency amount, unit: '€ '
  end
end
