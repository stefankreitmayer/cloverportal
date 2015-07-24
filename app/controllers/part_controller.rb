class PartController < ApplicationController
  skip_before_action :authorize, only: [:create]
  respond_to :json

  def create
    group = Group.find_by(groupname: params[:groupname])
    part = Part.create(role: 'player', index: group.parts_count) if group

    if part
      render json: part
    else
      render nothing: true, status: :not_found
    end
  end
end
