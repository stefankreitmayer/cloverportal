class GroupsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  respond_to :json

  def lead
    @group = logged_in_group
  end

  def create
    group = Group.new(group_params)
    if group.save
      login group
      render json: {url: lead_path}, status: 201
    else
      render json: {error: group.errors.full_messages}, status: 406
    end
  end

  def logout
    session[:group_id] = nil
    redirect_to root_path
  end

  private

  def login(group)
    session[:group_id] = group.id
  end

  def group_params
    params.require(:group).permit(:groupname, :password)
  end
end
