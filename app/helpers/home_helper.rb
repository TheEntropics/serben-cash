module HomeHelper
  def additional_badge(name)
    "<span class='label badge-pro'>#{name}</span>".html_safe
  end
end