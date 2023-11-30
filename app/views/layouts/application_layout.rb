# frozen_string_literal: true

class ApplicationLayout < ApplicationView
  include Phlex::Rails::Layout

  def template(&)
    doctype

    html do
      head do
        title { "My Trello Clone" }

        meta name: "viewport", content: "width=device-width,initial-scale=1"
        csp_meta_tag
        csrf_meta_tags

        stylesheet_link_tag("application", data_turbo_track: "reload")
        stylesheet_link_tag("tailwind", "inter-font", data_turbo_track: "reload")

        javascript_importmap_tags

        meta(name: "turbo-refresh-method", content: "morph")
        meta(name: "turbo-refresh-scroll", content: "preserve")
      end

      body(class: "m-2", data: { controller: "modal" }) do
        nav(class: "mb-4 border-b") {
          link_to("Home", root_path, class: "p-2")
        }

        main(class: "mt-8", &)
      end
    end
  end
end
