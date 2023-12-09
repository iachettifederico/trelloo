# frozen_string_literal: true

class ApplicationComponent < Phlex::HTML
  include Rails.application.routes.url_helpers

  register_element :turbo_frame

  delegate :dom_id, to: :helpers
  delegate :form_with, to: :helpers

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
      comment { "After #{self.class.name}" }
    end
  end

  def turbo_frame_tag(id, &)
    plain(turbo_frame(id: id, &))
  end

  def form_for(model, **, &)
    render ApplicationForm.for(model, **, &)
  end

  def link_to(*)
    plain(helpers.link_to(*))
  end

  def single_field_wrapper(model:, field:, &)
    turbo_frame_tag([dom_id(model), field], &)
  end
end
