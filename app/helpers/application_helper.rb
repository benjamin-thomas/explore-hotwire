module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def maybe_form_errors_for(model)
    return if model.errors.empty?

    tag.div class: "error-message" do
      model.errors.full_messages.to_sentence.capitalize
    end
  end
end
