# frozen_string_literal: true

class TaskCardComponent < ApplicationComponent
  def self.for(task)
    new(task: task)
  end

  def template
    div(
      class: "px-2 py-1 bg-gray-100 border border-2 cursor-move rounded-lg",
      data:  {
        sortable_id: task.id,
      }
    ) {
      plain helpers.turbo_stream_from(task)

      link_to(
        task.name, task_path(task),
        data: {
          action:      "click->modal#open",
          turbo_frame: "modal",
        }
      )
    }
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
