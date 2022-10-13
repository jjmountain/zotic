class TailwinduiFormBuilder < ActionView::Helpers::FormBuilder
  #

  def some_html(method, options = {})
    @template.content_tag(:div, class: "random-html") { super method, options }
  end

  def submit(value = nil, options = {})
    super(value, merge_options(options, { class: "form-button" }))
  end

  def text_field(method, options = {})
    text_layout(method, options, { class: "" }) do |method, input_options|
      super method, input_options
    end
  end

  def email_field(method, options = {})
    text_layout(method, options) do |method, input_options|
      super method, input_options
    end
  end

  def password_field(method, options = {})
    text_layout(method, options) do |method, input_options|
      super method, input_options
    end
  end

  private

  def text_layout(method, options, defaults = {})
    label_text = options.fetch(:label, method.to_s.humanize)
    label_defaults = { class: "text-input-label" }
    label_options =
      merge_options(label_defaults, options.fetch(:label_options, {}))
    input_defaults = merge_options({ class: "text-input" }, defaults)
    input_options =
      merge_options(input_defaults, options.fetch(:input_options, {}))

    @template.content_tag(:div, class: "form-wrapper-divider") do
      @template.label(@object_name, method, label_text, label_options) +
        @template.content_tag(:div, class: "text-input-wrapper") do
          yield(method, input_options)
        end
    end
  end

  def merge_options(defaults, new_options)
    (defaults.keys + new_options.keys).inject({}) do |h, key|
      h[key] = [defaults[key], new_options[key]].compact.join(" ")
      h
    end
  end
end
