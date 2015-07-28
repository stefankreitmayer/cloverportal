class PartsController < ApplicationController
  skip_before_action :authorize, only: [:create]
  respond_to :js

  def create
    group = Group.find_by(groupname: params[:groupname])
    if group
      @part = Part.create!(group: group)
      session[:part] = @part.id
      render 'main'
    else
      render 'group_not_found'
    end
  end

  def poll
    set_part
    render 'main'
  end

  def pick_character
    set_part
    puts params.inspect
    @part.update!(assigned: 'index', index: params[:index])
    render 'main'
  end

  private

  def set_part
    @part = Part.find(session[:part])
  end
end
