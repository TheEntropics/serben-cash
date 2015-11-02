module HomeHelper
  def additional_badge(badge)
    "<span class='label #{badge[1]}'>#{badge[0]}</span>".html_safe
  end
end