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

  # module Dom is separate because I include it into some system tests.
  module Dom
    def dom_id_nested(*args)
      args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
    end
  end
  include Dom
end
