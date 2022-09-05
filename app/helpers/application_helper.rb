module ApplicationHelper
  include Pagy::Frontend
  def error_message object, field
    message = object.errors[field].first if object.errors[field].present?
    content_tag(:div, message, class: "text-danger")
  end

  def full_title page_title = ""
    base_title = t("base_title")
    page_title.blank? ? base_title : [page_title, base_title].join(" | ")
  end

  def custom_bootstrap_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def get_cart_count_header
    cart_count = 0
    if session[:cart].present?
      session[:cart]["products"].each_value do |product|
        cart_count += product["count"] if product
      end
    end
    cart_count
  end
end
