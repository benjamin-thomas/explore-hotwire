module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
