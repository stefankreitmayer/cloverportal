require 'core/group'

class PartsController < ApplicationController
  respond_to :json

  def create
    sleep 0.4 #wait for client-side animation and slow down silly attacks
    group = Group.find(params[:groupname])
    part = Part.create(role: 'player', index: Part.count) if group

    if part
      render json: part
    else
      render nothing: true, status: :not_found
    end
  end
end
