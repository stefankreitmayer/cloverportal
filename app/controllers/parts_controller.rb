class PartsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  respond_to :json

  def create
    group = Group.find_by(groupname: params[:groupname])
    if group
      part = Part.create!(group: group, index: group.parts_count)
      render json: part
    else
      render nothing: true, status: :not_found
    end
  end
end
