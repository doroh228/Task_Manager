class PrioritiesController < ApplicationController
  def index
    @priorities = Priority.all
    render json: { result: 'Empty array' }, status: 200 if @priorities.empty?
  end
end
