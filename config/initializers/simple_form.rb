SimpleForm.setup do |config|
  config.wrappers :default, class: "form__group" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: "visually-hidden"
    b.use :input, class: "form__input", error_class: "form__input--invalid"
  end

  # Default configuration
  config.generate_additional_classes_for = []
  config.default_wrapper                 = :default
  config.button_class                    = "btn"
  config.label_text                      = lambda { |label, _, _| label }
  config.error_notification_tag          = :div
  config.error_notification_class        = "error_notification"
  config.browser_validations             = false
  config.boolean_style                   = :nested
  config.boolean_label_class             = "form__checkbox-label"
end

#########################################
# Below is ugly, but it works!
# Ref: https://stackoverflow.com/questions/29075404/how-can-i-generate-inputtype-date-with-simple-form
# Also see: https://github.com/heartcombo/simple_form/issues/1739
#########################################

# Use html5 date inputs by default, use html5: false to force
# the use of multiple selects
class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  private

    def use_html5_inputs?
      input_options.fetch(:html5, true)
    end
end