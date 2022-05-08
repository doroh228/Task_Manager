class RolesController < ApplicationController
  def index
    @roles = Role.all
    render json: { result: 'Empty array' }, status: 200 if @roles.empty?
  end

end
