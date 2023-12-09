# frozen_string_literal: true

class Modal < ApplicationComponent
  def template
    div(
      class: backdrop_style,
      data:  {
        modal_target: "modal",
        action:       "click->modal#close keydown@window->modal#handleKeydown",
      }
    ) {
      div(class: modal_style) {
        turbo_frame_tag("modal") do
          span(class: modal_style) { "Loading ..." }
        end
      }
    }
  end

  private

  def backdrop_style
    %w[
      hidden

      fixed
      top-0
      left-0
      z-40
      w-full
      h-full
      bg-slate-400
      bg-opacity-50

      flex justify-center items-center
    ]
  end

  def modal_style
    [
      decoration,
      position,
      size,
    ].flatten.join(" ")
  end

  def decoration
    %w[
      p-8
      bg-white
      border
      border-gray-200
      border-2
      rounded-lg
      shadow-xl
      backdrop:bg-slate-400
      backdrop:bg-opacity-50
    ]
  end

  def content_style
    %w[
      text-gray-500
    ]
  end

  def position
    %w[
      z-40
    ]
  end

  def size
    %w[
      w-6xl
      max-w-[90%]
    ]
  end
end
