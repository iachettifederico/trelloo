# frozen_string_literal: true

class Tasks::ShowView < ApplicationView
  def self.for(task)
    new(task: task)
  end

  def template
    h1(class: "mb-3 font-semibold text-lg") { task.name }

    10.times { p { "task.template" } }
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
