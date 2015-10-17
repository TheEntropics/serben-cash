module ApplicationHelper
  def true_mark
    check_box_tag nil, 1, true, disabled: true
  end
  def false_mark
    check_box_tag nil, 0, false, disabled: true
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
