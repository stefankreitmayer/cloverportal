class PartsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  respond_to :js

  def create
    group = Group.find_by(groupname: params[:groupname])
    if group
      part = Part.create!(group: group)
      render 'create'
    else
      render 'group_not_found'
    end
  end
end
