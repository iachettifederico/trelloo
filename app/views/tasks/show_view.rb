# frozen_string_literal: true

class Tasks::ShowView < ApplicationView
  def self.for(task)
    new(task: task)
  end

  def template
    turbo_frame_tag(:modal) do
      single_field_wrapper(model: task, field: :name) do
        link_to(task.name, edit_task_path(task, field: :name), class: "mb-3 font-semibold text-lg")
      end
    end
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
