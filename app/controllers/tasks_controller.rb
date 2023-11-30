# frozen_string_literal: true

class TasksController < ApplicationController
  def show
    render Tasks::ShowView.for(task)
  end

  private

  def task
    Task.find(params[:id])
  end
end
