class GroupsController < ApplicationController
  respond_to :json

  def show
    @group = Group.find(params[:id])
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: {url: group_path(group)}, status: 201
    else
      render json: {error: group.errors.full_messages}, status: 406
    end
  end

  private

  def group_params
    params.require(:group).permit(:groupname, :password)
  end
end
